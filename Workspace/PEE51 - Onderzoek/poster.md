# Welke neuraal netwerk architectuur is het meest geschikt voor dit type regelprobleem?

Voor het naboosten van een PID regelaar bij de ping pong opstelling waren twee soorten neurale netwerken het meest geschikt:

1. **Long Short-Term Memory (LSTM)**: LSTM-netwerken zijn een type recurrent neuraal netwerk (RNN) dat goed presteert bij tijdreeksdata. Ze kunnen leren van sequentiële gegevens en zijn in staat om lange-termijn afhankelijkheden te onthouden, wat nuttig is voor regeltoepassingen waar de huidige output afhankelijk is van eerdere inputs. Dit maakt ze geschikt voor het modelleren van dynamische systemen zoals de pingpongbal opstelling.

2. **Convolutioneel Neuraal Netwerk (CNN)**: Hoewel CNN's meestal worden gebruikt voor beeldverwerking, kunnen ze ook nuttig zijn voor het extraheren van kenmerken uit tijdreeksen door gebruik te maken van convoluties. Dit kan helpen bij het identificeren van patronen in de gegevens die relevant zijn voor de regeling.


# Hoe kan trainingsdata verzameld worden om het gedrag van de PID-regelaar na te bootsen?

De data kan verzameld worden door:

1. **De PID-regelaar live te laten draaien** op het systeem (bijv. ventilator + pingpongbal).
2. **Ingangen (bijv. doelhoogte)** en **uitgangen (bijv. PWM-signaal van de PID)** te loggen.
3. Deze data op te slaan in een dataset bestaande uit (invoer, uitvoer)-paren, zoals:

   ```
   (doelwaarde, gemeten waarde) → PWM-uitgang
   ```

4. Extra inputs zoals fout (doelwaarde - gemeten waarde) en foutdifferentiatie kunnen als feature worden toegevoegd. of 

# Wat zijn de beperkingen van het gebruik van een neuraal netwerk in een embedded systeem?

In dit project gebruiken we de **FRDM-MCXN947** van de opdrachtgever om het neurale netwerk toe te passen op de PID-regelaar. Hoewel deze microcontroller relatief krachtig is voor embedded toepassingen (met een Arm® Cortex®-M33 en een Neural Processing Unit (NPU)), blijven er enkele belangrijke beperkingen:

- **Geheugenbeperkingen**: De MCXN947 heeft weliswaar tot 4 MB flash en 1 MB RAM, maar bij grotere neurale netwerken of float-gebaseerde modellen kan dit alsnog snel vol raken — vooral als er ook ruimte nodig is voor andere code, stacks en buffers.

- **Rekenkracht versus latency**: Hoewel de NPU (voor Arm Ethos-U55) inferentie kan versnellen, moet het netwerk wel compatibel zijn met het ondersteunde modelformaat. Zwaardere netwerken of modellen zonder optimalisatie kunnen alsnog leiden tot te lange inference-tijden voor real-time toepassingen zoals regelkringbesturing.

- **Beperkte ondersteuning voor AI-frameworks**: Alleen **TensorFlow Lite Micro** wordt goed ondersteund op dit type embedded systeem, en zelfs dan zijn er beperkingen in operators, kwantisatie en modelgrootte.

- **Debugbaarheid**: Een neuraal netwerk op de MCXN947 is lastiger te debuggen dan een klassieke PID-regelaar. Foutgedrag is minder intuïtief te herleiden, zeker zonder floating-point logging of visuele feedback.

- **betrouwbaarheid**: Waar een PID-regelaar voorspelbaar reageert op verstoringen, kan een neuraal netwerk onverwachte uitkomsten geven bij inputs buiten de trainingsrange. Dit is risicovol in embedded toepassingen waarbij betrouwbaarheid cruciaal is.

- **Optimalisatie vereist**: Om het netwerk überhaupt op de MCXN947 te laten draaien, is vaak modelcompressie nodig (zoals kwantisatie naar int8) en moet het model handmatig afgestemd worden op geheugen- en rekenlimieten.
