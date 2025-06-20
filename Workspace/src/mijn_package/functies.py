# ================================================
# IMPORTS
# ================================================
from sklearn.model_selection import train_test_split 
import pandas as pd
import numpy as np
import sys

import mijn_package.config as c

import mijn_package.mijn_logger as p
log = p.setup_logger()

# ================================================
# FUNCTIES
# ================================================

def inlezen_csv(CSV_PATH):
    """Inlezen van een CSV-bestand."""
    try:
        CSV_DATA = pd.read_csv(CSV_PATH)
        log.info(f"CSV-bestand '{CSV_PATH}' succesvol ingelezen.")
        log.debug(f"\nCSV-data:\n{CSV_DATA}") 
    except FileNotFoundError:
        log.warning(f"Fout: CSV-bestand '{CSV_PATH}' niet gevonden.")
        return None
    except pd.errors.EmptyDataError:
        log.warning(f"Fout: CSV-bestand '{CSV_PATH}' is leeg.")
        return None
    except Exception as e:
        log.warning(f"Fout bij het inlezen van het CSV-bestand: {e}")
        return None
    return CSV_DATA 

def Klaarmaken_data(CSV_DATA):
    """Klaarmaken van de data voor het model."""
    training_data = CSV_DATA[["Doelhoogte (m)", "Hoogte (m)"]] / 1
    log.info(f"\nBE_training_data:\n {training_data}")
    training_data = training_data.to_numpy()
    log.info(f"\nAF_training_data: {training_data.shape}")
    log.info(f"\nAF_training_data:\n {training_data}")
    
    training_labels = (CSV_DATA["PWM"] * 100).astype(int)
    log.info(f"\nBE_training_labels:\n {training_labels}")
    training_labels = training_labels.to_numpy()
    log.info(f"\nAF_training_labels: {training_labels.shape}")
    log.info(f"\nAF_training_labels:\n {training_labels}")

    # Splits de data in training en test sets
    training_data, test_data, training_labels, test_labels = train_test_split(training_data, training_labels, test_size = c.test_size, random_state = 42)
    log.info(f"\ntest_data: {test_data.shape}")
    log.info(f"\ntest_data:\n {test_data}")
    
    log.info(f"\ntest_labels: {test_labels.shape}")
    log.info(f"\ntest_labels:\n {test_labels}")

    return training_data, test_data, training_labels, test_labels

def print_data_labels(data, labels, naam):
    log.info(f"\n--- {naam} ---")
    log.info(f"\nShape: {data.shape}")
    log.info(f"\nLabel shape: {labels.shape}")
    log.info(f"\nUnieke labels: {np.unique(labels)}")
    log.info(f"\nLabel bereik: {np.min(data)} - {np.max(data)}")
    log.info(f"\nVoorbeeld label: {labels[0]}")
    log.info(f"\nVoorbeeld data:{data[0]}")