# AUTOMATED IMAGE CAPTIONING SYSTEM

Let's imagine one day while going to market you get to see a blind man finding it difficult to cross the road crowded with people and vehicles. How you will help that person in this situation. One way to help is to first ask for his permission, make him hold your arm and then help him to cross the road. But is it permanent solution? What about the situation if heis not enough comfortable to accept your help and hold your arm? Or what if there is no one around him to offer such help?

One of the possible permanent solution is of "automated guiding system", which is under research and development. This system in near future will take input of a captured video from eye-wear or head-gear used by blind people and will give a decription about ongoing activities in that video in form of text format captions which will then be converted to audio format. 

But before contributing any idea to this ongoing research we have to first understand the concept of "automated image captioning system". This is important to understand because generating captions for images quickly, accurately and in cost efficient manner will lead towards an efficient "automated guiding system" (which will work on input of captured video,i.e series of time-framed images).

## Let us now see the capability of "automated image captioning system" coded by me:-

![bandicam 2020-10-23 10-59-22-783](https://user-images.githubusercontent.com/71775151/96964503-30691400-1528-11eb-9b5a-821e9984aa33.jpg)

![bandicam 2020-10-23 11-01-07-074](https://user-images.githubusercontent.com/71775151/96965333-97d39380-1529-11eb-8f0e-1ac51c337c4d.jpg)

![bandicam 2020-10-23 11-19-08-501](https://user-images.githubusercontent.com/71775151/96965388-b0dc4480-1529-11eb-89d9-5c3dbb037e0d.jpg)

![bandicam 2020-10-23 11-31-19-095](https://user-images.githubusercontent.com/71775151/96965447-cb162280-1529-11eb-8d54-4b1932950972.jpg)

## Are you just shocked and amazed seeing these generated captions?? Want to give it a try on any of your image?? 

Well in a minute I will let you to experience this amazing moment all by yourself but before that I want to re-state the meaning of "any image" as of present situation. See as this model/system is trained on "Flick8k" dataset with just 8,000 images thus you can't expect it to be so generalised that it will understand each object in picture correctly everytime. 

Still have question that 8,000 images are sooo much, then also why this model isn't generalised? To make you understand this limitation I just want you to make a count that till now how many objects have you seen and know their identification? Maybe quite large that you can't even count in one go, is it so? So how can you expect this model to be so generalised with just 8,000 images, isn't this unfair?   

And before moving ahead towards code, I would let you know that I could have trained this model on larger dataset like "MS-COCO" having 300,000+ unique images. But being an undergraduate student I have limited compuational resources. So will try to improve this model further when will have my first salary cheque in my hand.

Now, I think I have told you enough about limitations of my model as of present state, but to be honest this model isn't that bad.

## Time to give you first hand experience of generating caption for image of you choice, but consider the note I have given above.
Ok so to make you try it on your own I would like you to follow these 7 steps. But please don't be in excitement to just start implementing the first of 7 steps. First please read them all and then start implementing. So let's begin:-

**STEP 1)** Right click on this link and open it new tab:- https://drive.google.com/drive/folders/1Nw4H5rttfy1O8Qf-GIGkqUOBeyoHKSOg?usp=sharing .<br><br>

**STEP 2)** Now open your Google Drive in new tab of your browser and click on "Shared with me" present at your left hand side.<br>
![bandicam 2020-10-23 14-01-58-491](https://user-images.githubusercontent.com/71775151/96978348-e4c06580-153b-11eb-9f9c-c29abd226b99.jpg)<br><br>

**STEP 3)** Inside "Shared with me" you will see the folder named "github_malay_image_captioning".<br>
![bandicam 2020-10-23 14-02-37-893](https://user-images.githubusercontent.com/71775151/96978633-31a43c00-153c-11eb-825a-680a3978bff0.jpg)<br><br>

**STEP 4)** Just right click over that folder and click on "Add shortcut to Drive".<br>
![bandicam 2020-10-23 14-03-11-765](https://user-images.githubusercontent.com/71775151/96978872-77610480-153c-11eb-9b88-1777fcffd1fc.jpg)<br><br>

**STEP 5)** Now click on "My Drive".<br> 
![bandicam 2020-10-23 14-01-58-491](https://user-images.githubusercontent.com/71775151/96978348-e4c06580-153b-11eb-9f9c-c29abd226b99.jpg)<br>
There find the folder "github_malay_image_captioning". Click on it and now you have all the pickeled files required for generating captions for your desired image.<br>
![bandicam 2020-10-23 14-04-32-804](https://user-images.githubusercontent.com/71775151/96981033-269ddb80-153d-11eb-8265-729abdae19ca.jpg)<br><br>

**STEP 6)** Now inside "github_malay_image_captioning" folder you will see one Google Colab file named "testing_image_captioning.ipynb".<br>
![bandicam 2020-10-23 15-09-04-407](https://user-images.githubusercontent.com/71775151/96989377-37e9e680-1543-11eb-98f3-840c8247f0b6.jpg)<br>
Open that file and in "step7" inside that file replace path of default test image to path of image you want model to generate caption of. Run all the code snippets and you will get the generated caption of your image.<br>
![bandicam 2020-10-23 15-25-33-152](https://user-images.githubusercontent.com/71775151/96990095-4553a080-1544-11eb-8cbf-4637be5eb090.jpg)<br>

## What are you now waiting for? Just follow above steps and see what "image captioning system" are capable of..<br>
## And please come back to this same place. Something more exciting is waiting for you!!<br><br><br><br><br><br><br><br><br><br><br><br>



## Ohh I am glad you have come back. 
I know after generating caption all by yourself you will be too amazed and ofcourse loaded with tones of questions about how it is been done? How I trained my model to do so?<br><br>
So to answer all your queries I would like you to first right click on this link and open it new tab:- https://drive.google.com/drive/folders/188biLoItb0OyD91hVLMDqKSjD7sbDdYh?usp=sharing. Then go to "Shared with me". There you will see foldernamed "Flickr8k_Dataset". Right click on that and click on "Add shortcut on drive". Then come back to main page of google drive by clicking on "My Drive". Here you will find shortcut to "Flickr8k_Dataset" folder.<br>
After this go to "github_malay_image_captioning" and open "training_image_captioning.ipynb" <br>

Now after this you have 2 options:-<br>
**First option** :- See the code, understand it's explanation and run all code cells except those which have comment of **"don't run.."**. Doing this you will understand that how model was generating the captions and also the evaluation result that how well model is generating the captions for images it hasn't seen during training period.<br><br>

**Second option** :- See the code, understand it's explanation, change the hyperparamters, load a new training dataset and run all code cells to look for ways to enhance the accuracy of caption generation process.

## With this I woulk like to end the journey you did with me across different stages of code for "automated image captioning system".
**Pull requests for making this system more enhanced are warmly welcome. And I would really enjoy to answer any of the issues you face while dealing with this code.**<br><br><br>
**Will meet soon with a new journey of code.**



