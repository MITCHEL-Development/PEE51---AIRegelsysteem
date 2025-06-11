"""Main file voor het uitvoeren van het programma."""
# ================================================
# IMPORTS
# ================================================
import os
import sys
import time

import requests
import threading
import tty
import termios

from datetime import datetime, timedelta
now = datetime.now()

import tensorflow as tf
from tensorflow import keras
import keras
from keras import layers
import numpy as np
import matplotlib.pyplot as plt
import random
import math
from keras import callbacks
from sklearn.model_selection import train_test_split 
# Voeg src/ toe aan het zoekpad
sys.path.append(os.path.join(os.path.dirname(__file__), 'src'))

import mijn_package.config as c

import mijn_package.functies as f

import mijn_package.modelconverter as m

import mijn_package.mijn_logger as p
log = p.setup_logger()

from mijn_package.cli import start_cli


# ================================================
# CONSTANTEN
# ================================================
VERSIE = "1.0"
GROEN = "\033[92m"
ROOD = "\033[91m"
RESET = "\033[0m"

# ================================================
# HULPFUNCTIES
# ================================================

def build_feedforward_model(input_layer_size, hidden_layer_size, hidden_layer_size_2, output_layer_size):
    """Bouw een neuraal netwerkmodel volgens TensorFlow-conventies."""
    model = keras.Sequential(name="Feedfoward_Model")
    model.add(layers.Input(shape=(c.input_layer_size,), name="Input_Layer"))
    model.add(layers.Dense(hidden_layer_size, activation='sigmoid', name="Hidden_Layer"))
    model.add(layers.Dense(hidden_layer_size_2, activation='sigmoid', name="Hidden_Layer_2"))
    model.add(layers.Dense(output_layer_size, activation='softmax', name="Output_Layer"))
    return model


def build_LSTM_model(input_layer_size, hidden_layer_size, output_layer_size):
    """LSTM-model"""
    model = keras.Sequential(name="LSTM_model")
    model.add(layers.LSTM(hidden_layer_size, input_shape=(1, input_layer_size), name="LSTM_Layer"))
    model.add(layers.Dense(output_layer_size, activation='softmax', name="Output_Layer"))
    return model



 
def save_dense_weights_to_file(model, filepath):
    """Sla de gewichten en biases van Dense-lagen op naar een bestand."""
    os.makedirs(os.path.dirname(filepath), exist_ok=True)
    with open(filepath, "w") as f:
        for i, layer in enumerate(model.layers):
            if isinstance(layer, layers.Dense):
                weights, biases = layer.get_weights()
                f.write(f"Layer {i} - {layer.name} Weights:\n{weights}\n\nBiases:\n{biases}\n\n")
    print(f"Gewichten en biases zijn opgeslagen in '{filepath}'.")

  
def print_model_weights_baises(model):
    """Print de gewichten en biases van alle lagen in een Keras-model."""
    for layer in model.layers:
        weights = layer.get_weights()
        print(f"Layer: {layer.name}")
        if weights:
            if len(weights) == 2:
                print(f"  Weights:\n{weights[0]}")
                print(f"  Biases:\n{weights[1]}")
            else:
                # Sommige lagen (zoals LSTM) hebben meerdere weight-matrices
                print("  Gewichten bestaan uit meerdere delen:")
                for i, w in enumerate(weights):
                    print(f"    Part {i}:\n{w}")
        else:
            print("  Geen trainbare gewichten\n")  

def print_layer_weight_stats(model):
    """Print het minimum en maximum gewicht per Dense-laag in het model."""
    for layer in model.layers:
        if isinstance(layer, layers.Dense):
            weights, biases = layer.get_weights()
            print(f"\nLayer: {layer.name}")
            print(f"  Gewicht shape: {weights.shape}")
            print(f"  Min gewicht: {np.min(weights):.6f}")
            print(f"  Max gewicht: {np.max(weights):.6f}")

def train_with_tensorboard(model, training_data, training_labels, val, epochs, batch_size):
    """Train een model met TensorBoard logging."""
    log_dir = "logs/fit/" + datetime.now().strftime("%Y%m%d-%H%M%S")
    tensorboard_callback = keras.callbacks.TensorBoard(
        log_dir=log_dir,
        histogram_freq=1,        # registreer gewichten & biases
        write_graph=True,        # sla modelstructuur op
        write_images=True,       # visualiseer gewichten als plaatjes
        update_freq='epoch'      # hoe vaak loggen (per batch of epoch)
    )

    model.compile(optimizer=keras.optimizers.legacy.Adam(), loss=keras.losses.SparseCategoricalCrossentropy(), metrics=['accuracy'])

    history = model.fit(
        training_data, training_labels,
        validation_data=val,
        epochs=epochs,
        batch_size=batch_size,
        callbacks=[tensorboard_callback],
        verbose=2
    )
    print(f"TensorBoard log opgeslagen in: {log_dir}")
    print("Gebruik 'tensorboard --logdir logs/fit' om te starten.")
    

def getscores(model, test_data, test_labels):
    """Evalueer het model op de testset."""
    scores = model.evaluate(test_data, test_labels)
    print(f"{model.metrics_names[1]} : {round(scores[1]*100, 2)} %")
    return scores


def plot_voorspellingen(test_labels, predictions, start=0, eind=20):
    # Maak voorspelde labels
    voorspelde_labels = np.argmax(predictions, axis=1)

    # Plot
    plt.figure(figsize=(12, 6))
    plt.plot(range(start, eind), test_labels[start:eind], label='Werkelijke PWM', marker='o')
    plt.plot(range(start, eind), voorspelde_labels[start:eind], label='Voorspelde PWM', marker='x')
    plt.title(f'Werkelijke vs Voorspelde PWM (van {start} t/m {eind-1})')
    plt.xlabel('Voorbeeld index')
    plt.ylabel('PWM waarde')
    plt.legend()
    plt.grid(True)
    plt.tight_layout()
    plt.show()
    

# ================================================
# MAIN FUNCTIE
# ================================================
def main() -> None:
    """Hoofdfunctie die het programma uitvoert."""
    log.info(f"{GROEN}--- Start van het programma - {now.strftime('%Y-%m-%d %H:%M:%S')} ---{RESET}")
    
    """CSV-bestand in lezen"""
    CSV_data = f.inlezen_csv(c.CSV_PATH)
    
    """"Klaarmaken van de data voor het model"""
    training_data, test_data, training_labels, test_labels = f.Klaarmaken_data(CSV_data)
    f.print_data_labels(training_data, training_labels, "Trainingset")
    f.print_data_labels(test_data, test_labels, "Testset")
    
    """model aanmaken"""
    model = build_feedforward_model(c.input_layer_size, c.hidden_layer_size,c.hidden_layer_size_2, c.output_layer_size)
    
    """model samenvatten"""
    model.summary()
    
    """model compilen"""
    model.compile(optimizer='rmsprop', loss='sparse_categorical_crossentropy', metrics=['accuracy'])
    
    
    
    """model trainen"""
    model.fit(training_data, training_labels, epochs=c.epochs, batch_size=32, validation_data=(test_data, test_labels))
    
    
    # Plot the training history
    loss = model['loss']
    val_loss = model['val_loss']
    epochs = range(1, len(loss) + 1)
    plt.plot(epochs, loss, 'bo', label='Training loss')
    plt.plot(epochs, val_loss, 'b', label='Validation loss')
    plt.title('Training and validation loss')
    plt.legend()
    plt.show()
    
    print_model_weights_baises(model)
    print_layer_weight_stats(model)
    model.evaluate(test_data, test_labels)
    
    """model opslaan"""
    m.convert_model_to_tflite_and_c_header(model, c.tflite_path, c.header_path, c.var_name)
    m.convert_model_to_tflite_and_c_header_float(model, c.tflite_path, c.header_path_float, c.var_name_float)
    save_dense_weights_to_file(model, c.FILE_PATH)
    
    # Plot predictions against actual values
    predictions = model.predict(test_data)

    plt.clf()
    plt.title("Comparison of predictions to actual values")
    voorspellingen = np.argmax(predictions, axis=1)
    x_as = np.arange(len(test_labels))  # of test_data[:, 0] voor doelhoogte

    plt.plot(x_as, test_labels, 'b.', label='Actual')
    plt.plot(x_as, voorspellingen, 'r.', label='Prediction')
    plt.legend()
    plt.show()
    
    
    # """model voorspellen"""
    # predictions = model.predict(test_data)
    # np.set_printoptions(suppress=True)
    # # for i in range(len(test_labels)):
    # #     print(f"Voorbeeld {i}:")
    # #     print(f"  Werkelijk label (PWM): {test_labels[i]}")
    # #     print(f"  Voorspelde label: {np.argmax(predictions[i])}")
    # #     print(f"  Waarschijnlijkheid: {np.max(predictions[i]):.4f}")
    # #     print("-" * 30)
    getscores(model, test_data, test_labels)
    
    # plot_voorspellingen(test_labels, predictions, start=0, eind=10000)
    
    
    
    
    plt.show()
    
    
    
    # h.begroet_gebruiker("Jan")
    # som = b.tel_op(5, 7)
    # print(f"De som is: {som}")
    # log.info(f"De som is: {som}")
    # log.info("Programma voltooid zonder fouten.")
    # # Je programma
    # log.info("Programma gestart")
    # log.debug("Dit is een debug bericht")
    # log.warning("Opgelet: mogelijk probleem")
    # log.error("Er is een fout opgetreden")
    # log.critical("Kritieke fout! Programma kan niet doorgaan")
    # file("Hallo Jan! Welkom bij het programma.")
    # resultaat = 5 + 20
    # file(f"De som is: {resultaat}")
    # file("Programma voltooid zonder fouten.")
          

    

# ================================================
# ENTRY POINT
# ================================================
if __name__ == "__main__":
    main()
    #start_cli()
    