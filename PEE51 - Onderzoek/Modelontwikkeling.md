# Onderzoekopzet

## Titel  

---

## Probleemschets  

Hogeschool Rotterdam beschikt voor de cursus Digitale Systemen (DIS10) over een opstelling waarbij een pingpongbal op een ingestelde hoogte wordt gehouden. Deze opstelling bestaat uit een verticale buis met onderaan een ventilator. Door de luchtdruk van de ventilator wordt de bal omhoog geblazen. Met behulp van een microcontroller wordt de ventilator aangestuurd, zodat de bal op een gewenste hoogte blijft zweven. De regeling van de ventilatorsnelheid gebeurt momenteel met behulp van een PID-regelaar (Proportioneel-Integrerend-Differentieel), waarbij de afwijking tussen de gewenste en werkelijke hoogte continu wordt bijgestuurd.

Hoewel deze opstelling functioneert zoals bedoeld, is het instellen van de PID-parameters vaak een handmatig proces. Het vergt tijd om het systeem goed af te stemmen om het uiteindelijk stabiel te laten reageren op hoogteveranderingen. Daarnaast kunnen veranderingen in de omgeving (zoals temperatuur of luchtvochtigheid) de prestaties van de PID-regelaar beïnvloeden.

De begeleidende docent heeft de vraag gesteld of deze traditionele regelmethode vervangen kan worden door een benadering gebaseerd op machine learning. Machine learning biedt de mogelijkheid om op basis van data te leren hoe het systeem zich moet gedragen. In dit project wordt onderzocht of het mogelijk is om een machine learning model te ontwikkelen dat het gedrag van de PID-regelaar kan nabootsen of zelfs verbeteren.

Dit onderzoek is relevant omdat het laat zien hoe klassieke regeltechniek gecombineerd of vervangen kan worden door moderne, zelflerende systemen. Daarnaast sluit het aan bij actuele ontwikkelingen binnen de techniek en biedt het studenten inzicht in zowel embedded systemen als kunstmatige intelligentie. Uiteindelijk is het doel om een demonstratie-opstelling te creëren die gebruikt kan worden tijdens bijvoorbeeld open dagen, om zo op een toegankelijke manier beide technieken te tonen.

---

## Doel van het onderzoek

### 1.1 Doelstellingen

Het doel van dit deel van het onderzoek is om een neuraal netwerk te ontwikkelen dat in staat is het gedrag van een PID-regelaar na te bootsen in een simulatieomgeving. Door middel van het verzamelen van trainingsdata, het kiezen van een geschikte netwerkarchitectuur en het trainen van het model, wordt onderzocht of het netwerk vergelijkbare of betere prestaties kan leveren dan de traditionele regelaar. Het uiteindelijke doel is om een model op te leveren dat klaar is voor implementatie op een embedded systeem, waarbij de nadruk ligt op nauwkeurigheid, stabiliteit en reproduceerbaarheid.

### 1.2 Belanghebbenden  

De belangrijkste belanghebbenden in dit deelonderzoek zijn de studenten en docenten van de opleiding Elektrotechniek aan de Hogeschool Rotterdam. Voor studenten biedt dit project een leerervaring in het toepassen van kunstmatige intelligentie binnen een praktisch regelsysteem. Ze leren niet alleen over neurale netwerken, maar ook over de analyse van bestaande regelaars, datastructuren en modeltraining.

Voor docenten is dit onderzoek van waarde als onderwijsmiddel; het toont aan hoe klassieke regeltechniek gecombineerd kan worden met moderne AI-toepassingen. Daarnaast draagt het bij aan het ontwikkelen van vernieuwend lesmateriaal dat aansluit bij de actuele technologische ontwikkelingen. Ook toekomstige studenten kunnen profiteren van de uitkomsten van dit onderzoek doordat het mogelijk geïntegreerd wordt in demonstratieopstellingen of lesmodules

---

## Onderzoeksvragen

### 1.3 Hoofdvraag  

**Hoe kan een neuraal netwerk op basis van simulatiegegevens het gedrag van een PID-regelaar modelleren voor hoogtecontrole van een pingpongbal?**

### 1.4 Deelvragen  

1. Hoe werkt een PID-regelaar en hoe wordt deze toegepast?
2. Welke soorten neurale netwerken zijn geschikt op een embedded systeem?
3. Hoe verzamelen we trainingsdata?
4. Welke NN netwerkarchitectuur (bijv. feedforward, recurrent) is het meest geschikt voor dit type regelprobleem?
5. Hoe kunnen loss-functies en optimalisatietechnieken afgestemd worden op het gedrag van een PID-regelaar?
6. Op welke manier kan de nauwkeurigheid van het getrainde model geverifieerd worden binnen de simulatieomgeving?
7. Hoe beïnvloedt de kwaliteit en spreiding van de trainingsdata de prestaties van het netwerk?
8. Welke stappen zijn nodig om het getrainde model voor overdracht geschikt te maken (documentatie, export)?

- Prestaties in de simulatieomgeving
- Selecteren van relevante features en output (bijv. setpoint, huidige hoogte, stuurwaarde).
- Trainen en finetunen van het netwerk in Python (TensorFlow / PyTorch).
- Resultaten documenteren t.b.v. overdracht aan Team 2.

---

## Afbakening  

Dit onderzoek richt zich uitsluitend op de modelontwikkelingsfase van het project, waarbij het doel is om een neuraal netwerk te trainen dat het gedrag van een PID-regelaar kan nabootsen in een gesimuleerde omgeving. De implementatie van het model op embedded hardware valt buiten de scope van dit deelonderzoek en wordt uitgevoerd door een ander team.

Er wordt geen aandacht besteed aan alternatieve regelstrategieën zoals fuzzy logic of adaptieve regelaars. Ook wordt er geen vergelijking gemaakt met andere machine learning-technieken buiten neurale netwerken. De nadruk ligt op het ontwikkelen van een robuust en betrouwbaar model dat geschikt is voor real-time inferentie, mits geïmplementeerd op een geschikt platform.

---

## Onderzoeksaanpak

### 1.5 Data  
  
Voor dit deelonderzoek wordt trainingsdata verzameld in een gesimuleerde omgeving waarin de traditionele PID-regelaar actief is. De verzamelde gegevens bestaan uit:

- De gewenste hoogte (setpoint)
- De gemeten werkelijke hoogte van de pingpongbal
- De door de PID-regelaar gegenereerde aanstuurwaarde (bijv. PWM-percentage)
  
Deze data worden gestructureerd als input-output-paren waarmee het neuraal netwerk wordt getraind. De variatie in setpoints en omgevingscondities wordt meegenomen om het model robuust te maken.

### 1.6 Methode  
  
De volgende methoden worden toegepast binnen het onderzoek:
  
1. Analyse van de bestaande PID-regelaar in de simulatieomgeving.
2. Verzamelen en opschonen van trainingsdata.
3. Selectie van een geschikte netwerkarchitectuur (bijv. feedforward netwerk).
4. Opzetten van de trainingsomgeving in Python (bijv. TensorFlow of PyTorch).
5. Trainen van het model met gebruik van de gestructureerde data.
6. Evaluatie van de prestaties op basis van simulatie-uitvoer, zoals foutmarge, stabiliteit en convergeersnelheid.
7. Exporteren van het getrainde model voor overdracht naar Team 2.
  
Tijdens het trainen worden verschillende hyperparameters getest, zoals het aantal lagen, neuronen per laag, activatiefuncties en optimalisatiemethoden (zoals Adam of SGD).

### 1.7 Planning  
  
De werkzaamheden van Team 1 zijn verdeeld over de looptijd van het project zoals hieronder weergegeven:
  
- **Week 1–2**: Analyse van PID-regelaar en opzetten simulatieomgeving  
- **Week 3–4**: Verzamelen en opschonen van trainingsdata  
- **Week 5–6**: Ontwerp en training van het neuraal netwerk  
- **Week 7**: Validatie van het model en prestatievergelijking met PID  
- **Week 8**: Finaliseren van het model, documentatie en overdracht aan Team 2  
- **Week 9–10**: Ondersteuning bij presentatie en reflectie op de resultaten
