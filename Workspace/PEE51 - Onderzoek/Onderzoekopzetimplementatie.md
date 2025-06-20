# Onderzoekopzet

Onderzoek naar de implementatie van het neuraal netwerk op de microcontroller.
Onderzoek naar de implementatie van het neuraal netwerk op de microcontroller.

## Titel  

### Implementatie van een neuraal netwerk op een embedded systeem

---

## Probleemschets  

In dit onderzoek staat de implementatie van een getraind neuraal netwerkmodel op een embedded systeem centraal. Dit model is ontwikkeld om het gedrag van een PID-regelaar na te bootsen in een opstelling waarbij een pingpongbal op een bepaalde hoogte moet blijven zweven met behulp van een ventilator.

Het trainen en evalueren van het model is eerder uitgevoerd in een gesimuleerde omgeving. De nadruk van dit onderzoek ligt op het onderzoeken van de technische haalbaarheid en de prestaties van het neurale netwerk wanneer het wordt uitgevoerd op een microcontrollerplatform. Hierbij wordt gekeken naar rekenkracht, geheugengebruik, responstijd en integratie met sensoren en actuatoren.

De keuze om een neuraal netwerk op embedded hardware te draaien is relevant vanwege de toenemende rol van kunstmatige intelligentie in edge computing toepassingen. Daarnaast biedt het studenten praktische ervaring in het implementeren van AI op embedded platforms, wat aansluit bij actuele ontwikkelingen binnen de techniek en het onderwijs.

De demonstratie-opstelling is bedoeld als onderwijsmiddel tijdens bijvoorbeeld open dagen, en laat zien hoe AI praktisch toegepast kan worden in besturingssystemen.

---

## Doel van het onderzoek

### 1.1 Doelstellingen  

Het doel van dit onderzoek is om een getraind neuraal netwerk effectief te implementeren op een embedded systeem, zodanig dat het in real-time het gedrag van een PID-regelaar kan nabootsen in een fysieke opstelling. Hierbij ligt de focus op de technische realisatie en evaluatie van het model op het gebied van snelheid, nauwkeurigheid en betrouwbaarheid binnen een resource-constrained omgeving.

### 1.2 Belanghebbenden  

De belangrijkste belanghebbenden in dit onderzoek zijn de docenten van de opleiding Elektrotechniek aan Hogeschool Rotterdam, die de opstelling willen gebruiken als demonstratiemateriaal tijdens open dagen en onderwijsactiviteiten. Daarnaast zijn studenten belanghebbenden, omdat het project hen inzicht biedt in zowel klassieke regeltechniek als moderne AI-toepassingen. Tot slot is de opleiding zelf gebaat bij innovatieve en actuele lesmaterialen die aansluiten bij de technologische ontwikkelingen binnen het vakgebied.

---

## Onderzoeksvragen

### 1.3 Hoofdvraag  

**In hoeverre kan een neuraal netwerk het gedrag van een PID-regelaar in een embedded systeem nabootsen of verbeteren bij het op hoogte houden van een pingpongbal?**

### 1.4 Deelvragen  

1. Hoe werkt een PID-regelaar en hoe wordt deze toegepast in de huidige opstelling?  
2. Welke soorten neurale netwerken zijn geschikt voor regeltoepassingen in embedded systemen?  
3. Hoe kan trainingsdata verzameld worden om het gedrag van de PID-regelaar na te bootsen?  
4. Hoe presteert het getrainde neurale netwerk wanneer het geïmplementeerd is op een microcontroller?  
5. Wat zijn de beperkingen van het gebruik van een neuraal netwerk in een embedded omgeving?

---

## Afbakening  

Dit onderzoek richt zich uitsluitend op de implementatie van een reeds getraind neuraal netwerk op een embedded systeem in de context van een opstelling waarin een pingpongbal op een ingestelde hoogte wordt gehouden. Het trainen van het netwerk valt buiten de scope. In plaats daarvan ligt de nadruk op het optimaliseren van het model voor gebruik op embedded hardware, inclusief conversie, compressie en evaluatie van prestaties zoals geheugengebruik en responstijd.

Er wordt gewerkt met het NXP FRDM-MCXN947 Development board. Alternatieve regelstrategieën of het verbeteren van het trainingsproces maken geen deel uit van dit onderzoek.

---

## Onderzoeksaanpak

### 1.5 Data  

Voor het trainen van het neurale netwerk wordt gebruikgemaakt van data die wordt gegenereerd uit de bestaande PID-opstelling of een gesimuleerde variant daarvan. De data bestaat uit metingen van de werkelijke hoogte van de pingpongbal, de gewenste hoogte (setpoint), en het bijbehorende stuurcommando dat door de PID-regelaar is afgegeven aan de ventilator. Deze data wordt gebruikt als input-output paar om het netwerk te trainen. De kwaliteit en diversiteit van de data is bepalend voor de nauwkeurigheid van het model.

### 1.6 Methode  

Het onderzoek wordt uitgevoerd in de volgende stappen:

- Analyse van het huidige gedrag van de PID-regelaar aan de hand van gemeten data  
- Selectie en ontwerp van een geschikt type neuraal netwerk (bijv. feedforward of recurrent)  
- Opzetten van een trainingsomgeving in Python (bijv. met behulp van TensorFlow of PyTorch)  
- Converteren en optimaliseren van het getrainde model voor embedded gebruik  
- Evaluatie van de prestaties van het neurale netwerk aan de hand van testdata  
- Vergelijking met de prestaties van de PID-regelaar (zoals stabiliteit, snelheid en foutmarge)  
- Implementatie van het geoptimaliseerde model op het microcontrollerplatform  
- Testen van het systeem in de fysieke opstelling  

---

### 1.7 Planning  

Tijdens periode 3 is gewerkt aan het trainen en simuleren van het neuraal netwerk. In periode 4 wordt de focus verlegd naar het implementeren van het getrainde model op embedded hardware en het testen ervan in de praktijk.

**De planning voor periode 4 ziet er als volgt uit:**

- **Week 1–2**: Converteren en optimaliseren van het neuraal netwerk voor embedded gebruik  
- **Week 3–4**: Implementatie op het NXP FRDM-MCXN947 development board  
- **Week 5–6**: Testen en meten van prestaties (snelheid, nauwkeurigheid, stabiliteit)  
- **Week 7–8**: Documentatie van resultaten en opstellen van rapport  
- **Week 9–10**: Voorbereiding en uitvoering van eindpresentatie
