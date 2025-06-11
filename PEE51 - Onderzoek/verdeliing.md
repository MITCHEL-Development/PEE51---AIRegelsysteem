## Verdeling tussen twee teams

### 🔹 Team 1 – Modelontwikkeling & Validatie (Simulatieomgeving)

**Doelen:**

- Begrijpen en analyseren van de huidige PID-regelaar.
- Verzamelen en opschonen van trainingsdata uit simulaties of eerdere metingen.
- Ontwerpen en trainen van een geschikt neuraal netwerk.
- Evalueren van de prestaties van het model in de simulatieomgeving.

**Taken:**

- Deelvraag 1: Hoe werkt een PID-regelaar en hoe wordt deze toegepast?
- Deelvraag 2: Welke soorten neurale netwerken zijn geschikt?
- Deelvraag 3: Hoe verzamelen we trainingsdata?
- Eerste deel van deelvraag 4: Prestaties in de simulatieomgeving.
- Selecteren van relevante features en output (bijv. setpoint, huidige hoogte, stuurwaarde).
- Trainen en finetunen van het netwerk in Python (TensorFlow / PyTorch).
- Resultaten documenteren t.b.v. overdracht aan Team 2.

**Tussenproduct:**

- Een getraind en geëvalueerd model (bijvoorbeeld `.tflite` bestand) dat klaar is om geport te worden naar embedded hardware.

---

### 🔹 Team 2 – Embedded Implementatie & Testing

**Doelen:**

- Model optimaliseren voor embedded gebruik (conversie, quantization).
- Implementatie van het model op het NXP FRDM-MCXN947 board.
- Integratie met de bestaande sensoren en de ventilator.
- Metingen uitvoeren en de prestaties in de praktijk testen.

**Taken:**

- Tweede deel van deelvraag 4: Hoe presteert het model op een embedded systeem?
- Deelvraag 5: Wat zijn de beperkingen van een neuraal netwerk op een microcontroller?
- Data-acquisitie in real-time (sensorinput uitlezen, motor aansturen).
- Optimalisatie met TensorFlow Lite for Microcontrollers of CMSIS-NN.
- Debugging, validatie, benchmarken van CPU-gebruik/geheugen/responstijd.
- Feedback geven aan Team 1 bij performance issues.

**Tussenproduct:**

- Werkende implementatie op het embedded systeem.
- Meetrapport met vergelijking tussen model en PID-regelaar op echte hardware.

---

### 📌 Gezamenlijke momenten

- **Week 2–3:** Overdracht getraind model van Team 1 → Team 2  
- **Week 5–6:** Gezamenlijke evaluatie: PID vs. NN (simulatie + real-life)  
- **Week 7–8:** Rapport samenstellen met input van beide teams  
- **Week 9–10:** Eindpresentatie voorbereiden (eventueel demo)
