import cv2
import numpy as np

read_model = cv2.dnn.readNet("weights/yolov3.weights", "cfg/yolov3.cfg")
class_list = []
with open("coco.names", "r") as f:
    class_list = [line.strip() for line in f.readlines()]
    
layer_names = read_model.getLayerNames()
output_layers = [layer_names[i[0] - 1] for i in read_model.getUnconnectedOutLayers()]
colors = np.random.uniform(0, 255, size=(len(class_list), 3))

capture = cv2.VideoCapture(0)
frame_seq = 0

while True:
    _, frame = capture.read()
    frame_seq += 1
    height, width, channels = frame.shape
    feature = cv2.dnn.blobFromImage(frame, 0.00392, (416, 416), (0, 0, 0), True, crop=False)
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
            if confidence > 0.2:
                center_x = int(detect[0] * width)
                center_y = int(detect[1] * height)
                w = int(detect[2] * width)
                h = int(detect[3] * height)
                x = int(center_x - w / 2)
                y = int(center_y - h / 2)
                box.append([x, y, w, h])
                confidences.append(float(confidence))
                class_ids.append(class_id)
                
    index_list = cv2.dnn.NMSBoxes(box, confidences, 0.7, 0.3)
    font = cv2.FONT_HERSHEY_SIMPLEX
    
    for i in range(len(box)):
        if i in index_list:
            x, y, w, h = box[i]
            label = str(class_list[class_ids[i]])
            confidence = confidences[i]
            color = colors[class_ids[i]]
            cv2.rectangle(frame, (x, y), (x + w, y + h), color, 2)
            cv2.putText(frame, label + " " + str(round(confidence, 2)), (x, y + 10), font, 1, (0,0,0), 3)
    cv2.imshow("Real Time Detection", frame)
    key = cv2.waitKey(1)
    if key == 27:
        break
    
capture.release()
cv2.destroyAllWindows()