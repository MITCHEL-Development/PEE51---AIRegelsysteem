# Introductie

In deze handleiding wordt stap voor stap uitgelegd hoe het neuraal netwerk voor PEE51 project is opgesteld. Dit project is een onderdeel van de opleiding Elektrotechniek aan de Hogeschool Rotterdam. Het doel van deze handleiding is om stap voor stap uit te leggen hoe een neuraal netwerk ontwikkeld, getraind en geëvalueerd kan worden in Python met TensorFlow. Dit netwerk is bedoeld om het gedrag van een klassieke PID-regelaar na te bootsen of te verbeteren in een systeem waarbij een pingpongbal op een ingestelde hoogte wordt gehouden door middel van een ventilator. De aanpak richt zich op het bouwen van een werkend AI-model, met als einddoel het inzetten van dit model op een embedded platform. Daarbij ligt de nadruk op nauwkeurige en stabiele hoogtecontrole, net als bij de bestaande PID-regeling. In deze handleiding wordt uitsluitend ingegaan op de technische implementatie van het neuraal netwerk; aspecten zoals gebruikersinterface, documentatie of demonstratieopstelling blijven buiten beschouwing. Voor meer informatie over het prestatieonderzoek en de vergelijking met de PID-regelaar, zie het bijbehorende [onderzoeksrapport](https://example.com/onderzoek-ai-regelaar).

# Inleiding

## Benodigdheden

Voordat je aan de slag gaat met het neuraal netwerk, zijn er een aantal benodigdheden die je moet installeren. Zorg ervoor dat je de juiste versie van Python en de benodigde bibliotheken hebt. Deze handleiding gaat ervan uit dat je bekend bent met de basisprincipes van Python en het opzetten van een Python-omgeving. Als je nog niet bekend bent met Python, raden we aan om eerst een introductiecursus te volgen of de [officiële documentatie](https://docs.python.org/3/) te lezen.

De volgende onderdelen zijn essentieel voor het ontwikkelen, trainen en evalueren van het neuraal netwerk:

- **Python 3.10 of hoger:** De programmeertaal waarin het neuraal netwerk wordt ontwikkeld. Zorg dat je de nieuwste versie hebt geïnstalleerd.
- **TensorFlow 2.11 of hoger:** Een populaire open-source bibliotheek voor machine learning en deep learning, gebruikt voor het bouwen en trainen van neurale netwerken.
- **NumPy:** Een fundamentele bibliotheek voor wetenschappelijk rekenen in Python, handig voor het werken met arrays en wiskundige functies.
- **Matplotlib:** Een bibliotheek voor het maken van visualisaties in Python, nuttig voor het plotten van resultaten en het visualiseren van data.
- **Jupyter Notebook (optioneel):** Een interactieve omgeving voor het schrijven en uitvoeren van Python-code, handig voor het ontwikkelen en testen van het neuraal netwerk.
- **Een teksteditor of IDE:** Een omgeving waarin je Python-code kunt schrijven en uitvoeren, zoals Visual Studio Code, PyCharm of Jupyter Notebook.

Tijdens de stappen in deze handleiding worden alle geïmporteerde pakketten en hun toepassing in de code toegelicht.

### Versies van gebruikte pakketten

Voor dit project zijn de volgende pakketversies gebruikt om compatibiliteit en reproduceerbaarheid te waarborgen:

- **Pandas:** 2.2.3
- **NumPy:** 1.26.4
- **Matplotlib:** 3.10.1
- **TensorFlow:** 2.15.0
- **Keras:** 2.15.0

De onderstaande pakketten worden in dit project gebruikt en geïmporteerd in de code. Zorg dat je ze allemaal installeert voordat je begint:

- **pandas, numpy, matplotlib:** voor data-analyse en visualisatie
- **tensorflow, keras:** voor het bouwen, trainen en evalueren van het neuraal netwerk
- **scikit-learn:** voor dataset splitsing en normalisatie

Hieronder staat een voorbeeld van de benodigde imports in Python. Voeg deze code toe aan het begin van je Python-script of Jupyter Notebook:

```python
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import tensorflow as tf
from tensorflow import keras
from keras import layers, models, callbacks, preprocessing
from sklearn.model_selection import train_test_split 
from keras.layers import Input, Dense, Conv1D, Flatten
from keras.models import Model, Sequential
from sklearn.preprocessing import MinMaxScaler
import keras
```


# datavoorbereiden


# Modelbouwen

# Model compileren

# Model Trainen

# Model evalueren

# Model opslaan en exporteren

# Model laten runnen voor controle

# Model uitlezen voor Importeren in de microcontroller

# Model importeren naar de microcontroller (NXP_FRDM-MCXN947)

## Initialiseren van een 