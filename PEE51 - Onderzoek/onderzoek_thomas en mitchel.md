# Onderzoek implementatie microcontroller

----
# doel
jeidn

**Tussenproduct:**

- Werkende implementatie op het embedded systeem.
- Meetrapport met vergelijking tussen model en PID-regelaar op echte hardware.

# Onderzoekopzet

Onderzoek naar de implementatie van het neuraal netwerk op de microcontroller.
Onderzoek naar de opbouw van het neuraal netwerk voor de vervanging van een PID regelaar.

## Titel  

### Ontwerp van een neuraal netwerk ter vervanging van een PID-regelaar

----

## Probleemschets  

Hogeschool Rotterdam beschikt voor de cursus Digitale Systemen (DIS10) over een opstelling waarbij een pingpongbal op een ingestelde hoogte wordt gehouden. Deze opstelling bestaat uit een verticale buis met onderaan een ventilator. Door de luchtdruk van de ventilator wordt de bal omhoog geblazen. Met behulp van een microcontroller wordt de ventilator aangestuurd, zodat de bal op een gewenste hoogte blijft zweven. De regeling van de ventilatorsnelheid gebeurt momenteel met behulp van een PID-regelaar (Proportioneel-Integrerend-Differentieel), waarbij de afwijking tussen de gewenste en werkelijke hoogte continu wordt bijgestuurd.

Hoewel deze opstelling functioneert zoals bedoeld, is het instellen van de PID-parameters vaak een handmatig proces. Het vergt tijd om het systeem goed af te stemmen om het uiteindelijk stabiel te laten reageren op hoogteveranderingen. Daarnaast kunnen veranderingen in de omgeving (zoals temperatuur of luchtvochtigheid) de prestaties van de PID-regelaar beïnvloeden.

De begeleidende docent heeft de vraag gesteld of deze traditionele regelmethode vervangen kan worden door een benadering gebaseerd op machine learning. Machine learning biedt de mogelijkheid om op basis van data te leren hoe het systeem zich moet gedragen. In dit project wordt onderzocht of het mogelijk is om een machine learning model te ontwikkelen dat het gedrag van de PID-regelaar kan nabootsen of zelfs verbeteren.

Dit onderzoek is relevant omdat het laat zien hoe klassieke regeltechniek gecombineerd of vervangen kan worden door moderne, zelflerende systemen. Daarnaast sluit het aan bij actuele ontwikkelingen binnen de techniek en biedt het studenten inzicht in zowel embedded systemen als kunstmatige intelligentie. Uiteindelijk is het doel om een demonstratie-opstelling te creëren die gebruikt kan worden tijdens bijvoorbeeld open dagen, om zo op een toegankelijke manier beide technieken te tonen.

----
 
## Doel van het onderzoek

### 1.1 Doelstellingen  

Het doel van dit onderzoek is om te onderzoeken of een neuraal netwerk het gedrag van een PID-regelaar effectief kan nabootsen of verbeteren in een systeem waarbij een pingpongbal op een ingestelde hoogte wordt gehouden. Hierbij wordt een model ontwikkeld, getraind en geëvalueerd in een gesimuleerde omgeving. Uiteindelijk moet het model geschikt zijn voor implementatie op een embedded platform, met als doel een stabiele en nauwkeurige hoogtecontrole te realiseren. Het onderzoek richt zich op zowel de technische haalbaarheid als de vergelijking met de bestaande PID-regelaar.

### 1.2 Belanghebbenden  

De belangrijkste belanghebbenden in dit onderzoek zijn de docenten van de opleiding Elektrotechniek aan Hogeschool Rotterdam, die de opstelling willen gebruiken als demonstratiemateriaal tijdens open dagen en onderwijsactiviteiten. Daarnaast zijn studenten belanghebbenden, omdat het project hen inzicht biedt in zowel klassieke regeltechniek als moderne AI-toepassingen. Tot slot is de opleiding zelf gebaat bij innovatieve en actuele lesmaterialen die aansluiten bij de technologische ontwikkelingen binnen het vakgebied.

----

## Onderzoeksvragen

### 1.3 Hoofdvraag  

**In hoeverre kan een neuraal netwerk het gedrag van een PID-regelaar in een embedded systeem nabootsen of verbeteren bij het op hoogte houden van een pingpongbal?**

### 1.4 Deelvragen  

1. Hoe werkt een PID-regelaar en hoe wordt deze toegepast in de huidige opstelling?  
2. Welke soorten neurale netwerken zijn geschikt voor regeltoepassingen in embedded systemen?  
3. Hoe kan trainingsdata verzameld worden om het gedrag van de PID-regelaar na te bootsen?  
4. Hoe presteert het getrainde neurale netwerk vergeleken met de traditionele PID-regelaar?  
5. Wat zijn de beperkingen van het gebruik van een neuraal netwerk in een embedded omgeving?

----

## Afbakening  

Dit onderzoek richt zich uitsluitend op het vervangen van een PID-regelaar door een neuraal netwerk binnen de context van een opstelling waarin een pingpongbal op een ingestelde hoogte wordt gehouden. De nadruk ligt op het ontwikkelen, trainen en evalueren van een neuraal netwerkmodel in een gesimuleerde omgeving.

De fysieke implementatie op een embedded systeem maakt deel uit van de doelstelling, maar valt buiten de scope van dit onderzoek in termen van hardwareontwikkeling. Er wordt gebruikgemaakt van bestaande simulatieomgevingen en beschikbare sensordata om het model te trainen en testen.

Er wordt niet ingegaan op alternatieve regelstrategieën zoals fuzzy logic of adaptieve regelaars, en ook het optimaliseren van de klassieke PID-regelaar zelf valt buiten de scope. De focus ligt volledig op het onderzoeken van de toepasbaarheid en prestaties van een neuraal netwerk als vervanger.

Voor dit onderzoek wordt gewerkt met de **NXP FRDM-MCXN947 Development board** als microcontrollerplatform. Hoewel de oorspronkelijke DIS10-opstelling gebaseerd is op de **Texas Instruments SimpleLink Wi-Fi CC3230S Development kit**, is er door de opdrachtgever gekozen het onderzoek uit te voeren op een ander platform. Dit verschil in hardware kan eventueel invloed hebben op de uiteindelijke uitkomst of prestaties van de implementatie, bijvoorbeeld door verschillen in rekenkracht, beschikbare bibliotheken of ondersteuning voor machine learning-inferentie.

----

## Onderzoeksaanpak

### 1.5 Data  

Voor het trainen van het neurale netwerk wordt gebruikgemaakt van data die wordt gegenereerd uit de bestaande PID-opstelling of een gesimuleerde variant daarvan. De data bestaat uit metingen van de werkelijke hoogte van de pingpongbal, de gewenste hoogte (setpoint), en het bijbehorende stuurcommando dat door de PID-regelaar is afgegeven aan de ventilator. Deze data wordt gebruikt als input-output paar om het netwerk te trainen. De kwaliteit en diversiteit van de data is bepalend voor de nauwkeurigheid van het model.

### 1.6 Methode  

Het onderzoek wordt uitgevoerd in de volgende stappen:

- Analyse van het huidige gedrag van de PID-regelaar aan de hand van gemeten data  
- Selectie en ontwerp van een geschikt type neuraal netwerk (bijv. feedforward of recurrent)  
- Opzetten van een trainingsomgeving in Python (bijv. met behulp van TensorFlow of PyTorch)  
- Trainen van het model met gesimuleerde of gemeten data  
- Evaluatie van de prestaties van het neurale netwerk aan de hand van testdata  
- Vergelijking met de prestaties van de PID-regelaar (zoals stabiliteit, snelheid en foutmarge)  
- Eventueel vertalen van het getrainde model naar een embedded systeem (bijvoorbeeld met behulp van TensorFlow Lite of een microcontroller-inferentie bibliotheek)

----

### 1.7 Planning  

Tijdens periode 3 is gewerkt aan het voorbereiden van het onderzoek. In deze fase is de PID-regelaar gesimuleerd en is een begin gemaakt met het opzetten en trainen van een neuraal netwerk in een softwareomgeving op de computer. Deze voorbereidende werkzaamheden hebben ervoor gezorgd dat het onderzoek in periode 4 direct van start kan gaan.

**De planning voor periode 4 ziet er als volgt uit:**

- **Week 1–2**: Verzamelen en analyseren van trainingsdata op basis van de gesimuleerde PID-regelaar  
- **Week 3–4**: Verdere ontwikkeling en finetuning van het neuraal netwerk  
- **Week 5–6**: Evaluatie en vergelijking van het neurale netwerk met de PID-regelaar  
- **Week 7–8**: Documentatie van resultaten en opstellen van rapport  
- **Week 9–10**: Voorbereiding en uitvoering van eindpresentatie
