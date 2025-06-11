import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
from datetime import datetime, timedelta
import tensorflow as tf
from tensorflow import keras
from keras import layers, models, callbacks, preprocessing
from keras.preprocessing.sequence import TimeseriesGenerator
from sklearn.model_selection import train_test_split 
from keras.layers import Input, Dense, LSTM
from keras.models import Model
import keras




print("VERSIES:")
print(f"{'- Pandas':<12} = {pd.__version__}")
print(f"{'- Numpy':<12} = {np.__version__}")
print(f"{'- Matplotlib':<12} = {plt.matplotlib.__version__}")
print(f"{'- Tensorflow':<12} = {tf.__version__}")
print(f"{'- Keras':<12} = {keras.__version__}")