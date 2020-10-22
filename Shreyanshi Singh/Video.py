import cv2
import numpy as np
import tkinter
from tkinter import *
from tkinter import filedialog

def select_video():
    path = filedialog.askopenfilename()
    if len(path) > 0:
        capture = cv2.VideoCapture(path)
        frame_seq = 0
        
        read_model = cv2.dnn.readNet("weights/yolov3.weights", "cfg/yolov3.cfg")
        class_list = []
        with open("coco.names", "r") as f:
            class_list = [line.strip() for line in f.readlines()]
        
        colors = np.random.uniform(0, 255, size=(len(class_list), 3))
        layer_names = read_model.getLayerNames()
        output_layers = [layer_names[i[0] - 1] for i in read_model.getUnconnectedOutLayers()]
        
        while True:
            _, frame = capture.read()
            frame_seq += 1
            height, width, channels = frame.shape
            feature = cv2.dnn.blobFromImage(frame, 0.00392, (320, 320), (0, 0, 0), True, crop=False)
            read_model.setInput(feature)
            output = read_model.forward(output_layers)
            
            class_ids = []
            confidences = []
            box = []
            
            for out in output:
                for detect in out:
                    prob = detect[5:]
                    class_id = np.argmax(prob)
                    confidence = prob[class_id]
                    if confidence > 0.25:
                        center_x = int(detect[0] * width)
                        center_y = int(detect[1] * height)
                        w = int(detect[2] * width)
                        h = int(detect[3] * height)
                        x = int(center_x - w / 2)
                        y = int(center_y - h / 2)
                        box.append([x, y, w, h])
                        confidences.append(float(confidence))
                        class_ids.append(class_id)
                        
            index_list = cv2.dnn.NMSBoxes(box, confidences, 0.8, 0.3)
            font = cv2.FONT_HERSHEY_SIMPLEX
            
            for i in range(len(box)):
                if i in index_list:
                    x, y, w, h = box[i]
                    label = str(class_list[class_ids[i]])
                    confidence = confidences[i]
                    color = colors[class_ids[i]]
                    cv2.rectangle(frame, (x, y), (x + w, y + h), color, 2)
                    cv2.putText(frame, label + " " + str(round(confidence, 2)), (x, y + 30), font, 1, (0,0,0), 2)
            cv2.imshow("Video", frame)
            key = cv2.waitKey(1)
            
            if key == 27:
                break
    capture.release()
    cv2.destroyAllWindows()
    
root = Tk()
root.geometry("80x80")
btn = Button(root, text="Select a video", command=select_video)
btn.pack(side="bottom", fill="both", expand="yes", padx="20", pady="20")
root.mainloop()
     