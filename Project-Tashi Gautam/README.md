# Music Generation using LSTM

## Introduction

The current technological advancements have transformed the way we not only produce, but listen and work with music.We do not necessarily have to be a music expert in order to generate music. And with the advent of deep learning it has now become possible to generate music without the need of working with instruments artists. This offers artists more creative freedom and ability to explore different domains in music.
Our task here is to take some existing music data then train a model using this existing data. The model has to learn the patterns in music that we humans enjoy. Once it learns this, the model should be able to generate new_ music for us. It cannot simply copy-paste from the training data. It has to understand the patterns of music to generate new music. Now, what is music? In short music is nothing but a sequence of musical notes. Our input to the model is a sequence of musical events/notes. Our output will be new sequence of musical events/notes. In this case-study we have limited our self to single instrument music as this is our first cut model.
In this notebook, we will use LSTM cells, to build a character-based model that generates piano notes.

## Data Source:

1. https://magenta.tensorflow.org/datasets/maestro

**From the above data source we downloaded V1.0.0**

V1.0.0
This is the original release of the dataset, 2004 folder was used to produce all results.

## How to Run the Model

In order to run the model you can run the file "Music_Generation.ipynb ". You can stop the training after any epoch and the weights of the model will be saved to the file "Model_Weights.hdf5". I ran our model for total of 30 epochs. You can add more layers into your model and fine tune the existing layers in the model.

## How to Generate Music Sequence

Once the model is defined and weights are calculated then run "Generate_Music.ipynb" file. If the architecture of your model is different than just change the architecture of the model and then run the file. Your music file "Generated_Melody.mid" will be saved.

## Prerequisites

You need to have installed following softwares and libraries in your machine before running this project.
1. Python 3
2. Anaconda: It will install ipython notebook and most of the libraries which are needed like pandas, seaborn, matplotlib, numpy, music21, os, h5py, keras, tensorflow.

## Installing

1. Python 3: https://www.python.org/downloads/
2. Anaconda: https://www.anaconda.com/download/
3. Music21:
```
pip install music21
```
4. Keras:
```
pip install keras
```
5. Tensorflow:
```
pip install tensorflow
```

## Built With

* ipython-notebook - Jupyter Notebook/ Google Colab
* numpy- number python library
* pandas - data handling library
* music21 - music notes and chords handling library
* os - directory handling library
* Keras - Deep Learning Library
## References

* https://web.mit.edu/music21/doc/
* https://www.tandfonline.com/doi/full/10.1080/25765299.2019.1649972
* https://www.youtube.com/watch?v=_SN4i2KlTCg
* https://www.tensorflow.org/api_docs/python/tf/keras/layers
* https://magenta.tensorflow.org/
* https://arxiv.org/ftp/arxiv/papers/1804/1804.07300.pdf
* https://towardsdatascience.com/neural-networks-for-music-generation-97c983b50204