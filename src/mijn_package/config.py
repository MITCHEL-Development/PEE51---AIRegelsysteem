from pathlib import Path


# ================================================
# CONFIGURATIE
# ================================================
BESTANDSNAAM = "output.txt"
CSV_PATH = '/Users/mitchelreints/Desktop/05_Development/#Projecten/PEE51 - AIRegelsysteem/simulatie_resultaten.csv'
FILE_PATH = "/Users/mitchelreints/Desktop/05_Development/#Projecten/PEE51 - AIRegelsysteem/exports/model_gewichten.txt"
tflite_path = 'exports/mijn_model.tflite'
header_path = 'exports/mijn_model.h'
var_name = 'mijn_model'
header_path_float = 'exports/mijn_model_float.h'
var_name_float = 'mijn_model_float'



# Bepaal pad naar de exports-map relatief t.o.v. dit config-bestand
BASE_DIR = Path(__file__).resolve().parent.parent  # bijvoorbeeld: .../PEE51 - AIRegelsysteem
EXPORT_DIR = BASE_DIR / "exports"
FILE_PATH = EXPORT_DIR / "model_gewichten.txt"


# ================================================
# CONFIGURATIE VOOR HET NEURALE NETWERK
# ================================================

input_layer_size = 2
hidden_layer_size = 48
hidden_layer_size_2 = 48
output_layer_size = 101

lamb = 0.0
epochs = 1
test_size = 0.2
