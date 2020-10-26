import cv2
import numpy as np
import tkinter
from tkinter import *
from tkinter import filedialog

def select_image():
    path = filedialog.askopenfilename()
    if len(path) > 0:
        img = cv2.imread(path)
        img = cv2.resize(img, None, fx=0.4, fy=0.4)
        height, width, channels = img.shape
        
        read_model = cv2.dnn.readNet("weights/yolov3.weights", "cfg/yolov3.cfg")
        class_list = []
        with open("coco.names", "r") as f:
            class_list = [line.strip() for line in f.readlines()]
            
        colors = np.random.uniform(0, 255, size=(len(class_list), 3))    
        layer_names = read_model.getLayerNames()
        output_layers = [layer_names[i[0] - 1] for i in read_model.getUnconnectedOutLayers()]
        feature = cv2.dnn.blobFromImage(img, 0.00392, (416, 416), (0, 0, 0), True, crop=False)
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
                if confidence > 0.5:
                    center_x = int(detect[0] * width)
                    center_y = int(detect[1] * height)
                    w = int(detect[2] * width)
                    h = int(detect[3] * height)
                    x = int(center_x - w / 2)
                    y = int(center_y - h / 2)
                    box.append([x, y, w, h])
                    confidences.append(float(confidence))
                    class_ids.append(class_id)  
                    
        index_list = cv2.dnn.NMSBoxes(box, confidences, 0.5, 0.4)
        print(index_list)
        font = cv2.FONT_HERSHEY_SIMPLEX 
        
        for i in range(len(box)):
            if i in index_list:
                x, y, w, h = box[i]
                confidences[i] = round(confidences[i],3)
                color = colors[i]
                label = str(class_list[class_ids[i]])+ " "+ str(confidences[i])
                cv2.rectangle(img, (x, y), (x + w, y + h),color, 2)
                cv2.putText(img, label, (x, y + 1),font, 0.6,(0,0,0), 2)
        cv2.imshow("Image",img)
        cv2.waitKey(0)
        cv2.destroyAllWindows()
        
root = Tk()
root.geometry("80x80")
btn = Button(root, text="Select an image", command=select_image)
btn.pack(side="bottom", fill="both", expand="yes", padx="15", pady="15")
root.mainloop()
     
                
                
