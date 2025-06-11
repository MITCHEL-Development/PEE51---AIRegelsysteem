# Onderzoekopzet

---

het gedrag van de opstelling moet geanalyseerd worden en niet de PID controller zelf

# Onderzoeksrapport 

Is het mogelijk om een PID controller te vervangen door een AI

## 1. Inleiding

### 1.1 Aanleiding van het onderzoek

Hogeschool Rotterdam beschikt voor de cursus Digitale Systemen (DIS10) over een opstelling waarbij een pingpongbal op een ingestelde hoogte wordt gehouden. Deze opstelling bestaat uit een verticale buis met onderaan een ventilator. Door de luchtdruk van de ventilator wordt de bal omhoog geblazen. Met behulp van een microcontroller wordt de ventilator aangestuurd, zodat de bal op een gewenste hoogte blijft zweven. De regeling van de ventilatorsnelheid gebeurt momenteel met behulp van een PID-regelaar (Proportioneel-Integrerend-Differentieel), waarbij de afwijking tussen de gewenste en werkelijke hoogte continu wordt bijgestuurd.

Hoewel deze opstelling functioneert zoals bedoeld, is het instellen van de PID-parameters vaak een handmatig proces. Het vergt tijd om het systeem goed af te stemmen om het uiteindelijk stabiel te laten reageren op hoogteveranderingen. Daarnaast kunnen veranderingen in de omgeving (zoals temperatuur of luchtvochtigheid) de prestaties van de PID-regelaar beïnvloeden.

De begeleidende docent heeft de vraag gesteld of deze traditionele regelmethode vervangen kan worden door een benadering gebaseerd op machine learning. Machine learning biedt de mogelijkheid om op basis van data te leren hoe het systeem zich moet gedragen. In dit project wordt onderzocht of het mogelijk is om een machine learning model te ontwikkelen dat het gedrag van de PID-regelaar kan nabootsen of zelfs verbeteren.

Dit onderzoek is relevant omdat het laat zien hoe klassieke regeltechniek gecombineerd of vervangen kan worden door moderne, zelflerende systemen. Daarnaast sluit het aan bij actuele ontwikkelingen binnen de techniek en biedt het studenten inzicht in zowel embedded systemen als kunstmatige intelligentie. Uiteindelijk is het doel om een demonstratie-opstelling te creëren die gebruikt kan worden tijdens bijvoorbeeld open dagen, om zo op een toegankelijke manier beide technieken te tonen.

### 1.2 Doelstelling en relevantie

Het doel van dit onderzoek is om te onderzoeken of een neuraal netwerk het gedrag van een PID-regelaar effectief kan nabootsen of verbeteren in een systeem waarbij een pingpongbal op een ingestelde hoogte wordt gehouden. Hierbij wordt een model ontwikkeld, getraind en geëvalueerd in een gesimuleerde omgeving. Uiteindelijk moet het model geschikt zijn voor implementatie op een embedded platform, met als doel een stabiele en nauwkeurige hoogtecontrole te realiseren. Het onderzoek richt zich op zowel de technische haalbaarheid als de vergelijking met de bestaande PID-regelaar.

### 1.3 Onderzoeksvragen en afbakening

#### 1.3 Hoofdvraag  

**In hoeverre kan een neuraal netwerk het gedrag van een PID-regelaar in een embedded systeem nabootsen of verbeteren bij het op hoogte houden van een pingpongbal?**

#### 1.4 Deelvragen  

1. Hoe werkt een PID-regelaar en hoe wordt deze toegepast in de huidige opstelling?  
2. Welke soorten neurale netwerken zijn geschikt voor regeltoepassingen in embedded systemen?  
3. Hoe kan trainingsdata verzameld worden om het gedrag van de PID-regelaar na te bootsen?  
4. Hoe presteert het getrainde neurale netwerk vergeleken met de traditionele PID-regelaar?  
5. Wat zijn de beperkingen van het gebruik van een neuraal netwerk in een embedded omgeving?

Voor dit onderzoek wordt gewerkt met de **NXP FRDM-MCXN947 Development board** als microcontrollerplatform. Hoewel de oorspronkelijke DIS10-opstelling gebaseerd is op de **Texas Instruments SimpleLink Wi-Fi CC3230S Development kit**, is er door de opdrachtgever gekozen het onderzoek uit te voeren op een ander platform. Dit verschil in hardware kan eventueel invloed hebben op de uiteindelijke uitkomst of prestaties van de implementatie, bijvoorbeeld door verschillen in rekenkracht, beschikbare bibliotheken of ondersteuning voor machine learning-inferentie.

### 1.4 Leeswijzer

In dit rapport wordt eerst de benodigde theorie besproken (hoofdstuk 2), gevolgd door de gebruikte onderzoeksmethoden (hoofdstuk 3). Daarna worden de resultaten gepresenteerd (hoofdstuk 4) en besproken (hoofdstuk 5). Het rapport sluit af met conclusies en aanbevelingen (hoofdstuk 6).

## 2. Theoretisch kader

### 2.1 Werking van een PID-regelaar

Een PID-regelaar (Proportioneel-Integrerend-Differentiërend) is een veelgebruikte terugkoppelingsregelaar in regeltechniek, die als doel heeft een systeem naar een gewenste waarde (setpoint) te sturen door continu het verschil (de fout) tussen die gewenste waarde en de gemeten systeemoutput te corrigeren.  
  
De PID-regelaar bestaat uit drie componenten:
  
- **Proportioneel (P):** Deze component reageert op de huidige fout. Hoe groter de fout, hoe sterker de aansturing. Dit zorgt voor een directe correctie, maar kan leiden tot een blijvende fout (steady-state error) als deze component alleen wordt gebruikt.
  
- **Integrerend (I):** Deze component reageert op de opgetelde (geïntegreerde) fout in de tijd. Hierdoor kan de regelaar kleine resterende fouten wegwerken en wordt het systeem naar het exacte setpoint geduwd. Te veel integratie kan echter leiden tot traagheid of instabiliteit.
  
- **Differentiërend (D):** Deze component reageert op de snelheid waarmee de fout verandert. Dit helpt om snelle veranderingen te dempen en voorkomt overshoot door het systeem te vertragen voordat het het setpoint bereikt. De D-term maakt het systeem reactiever en stabieler bij plotselinge veranderingen.
  
De regeloutput \( u(t) \) van een PID-regelaar wordt meestal als volgt beschreven:
  
$$  
u(t) = K_p \cdot e(t) + K_i \cdot \int e(t)\,dt + K_d \cdot \frac{de(t)}{dt}  
$$

waarbij:

$$
\begin{aligned}
e(t) & = r(t) - y(t) \quad & \text{(de fout tussen de referentie en gemeten waarde)} \\
K_p & = \text{proportionele versterkingsfactor} \\
K_i & = \text{integrerende versterkingsfactor} \\
K_d & = \text{differentiërende versterkingsfactor}
\end{aligned}
$$
  
Een goed afgestemde PID-regelaar zorgt voor snelle respons, minimale overshoot, en een stabiele benadering van het setpoint zonder blijvende fout.

### 2.2 Neurale netwerken – basisprincipes

Een neuraal netwerk is een wiskundig model dat is geïnspireerd op de werking van het menselijk brein. Het bestaat uit een verzameling onderling verbonden knopen, ook wel neuronen genoemd, die georganiseerd zijn in lagen: een inputlaag, één of meerdere verborgen lagen en een outputlaag.

Elke verbinding tussen neuronen heeft een gewicht dat bepaalt hoe sterk een input wordt doorgegeven. Tijdens het doorlopen van het netwerk wordt elke input vermenigvuldigd met het bijbehorende gewicht, opgeteld met een bias en vervolgens door een activatiefunctie gehaald. Deze activatiefunctie bepaalt of en in welke mate het neuron wordt geactiveerd.

Het leerproces van een neuraal netwerk gebeurt aan de hand van trainingsdata. Op basis van de fout tussen de voorspelde output en de werkelijke waarde worden de gewichten aangepast met behulp van een algoritme zoals backpropagation in combinatie met gradient descent. Door herhaaldelijk trainen op veel voorbeelden leert het netwerk patronen en relaties herkennen in de data.

Neurale netwerken zijn bijzonder krachtig in het modelleren van complexe, niet-lineaire systemen, en worden daarom veel gebruikt in toepassingen zoals beeldherkenning, spraakverwerking en regeltechniek.

### 2.3 Vergelijking PID versus NN-regelaars

Zowel PID-regelaars als neurale netwerken kunnen worden ingezet om systemen te regelen, maar hun werking, toepassingsgebied en eigenschappen verschillen sterk.

**Verschillen:**

- **Regelprincipe:**  
  Een PID-regelaar is gebaseerd op een vaste wiskundige formule die werkt met de fout tussen gewenste en gemeten waarden. Een neuraal netwerk leert juist op basis van voorbeelddata een model van het systeemgedrag.

- **Aanpasbaarheid:**  
  PID-regelaars hebben vaste parameters $K_p$, $K_i$, $K_d$ die handmatig of via tuning bepaald worden. Neurale netwerken leren automatisch complexe relaties tijdens het trainen, zonder expliciet geprogrammeerde regels.

- **Complexiteit:**  
  PID-regelaars zijn relatief eenvoudig te implementeren en begrijpen. Neurale netwerken zijn complexer en vereisen meer rekenkracht en data.

- **Flexibiliteit:**  
  PID is minder geschikt voor sterk niet-lineaire systemen of systemen met veel vertraging. Neurale netwerken kunnen deze situaties beter aan, mits voldoende training.

- **Transparantie:**  
  PID-regelaars zijn goed uitlegbaar. Neurale netwerken zijn vaak 'black boxes', waarbij het moeilijk is om te achterhalen waarom een bepaalde beslissing wordt genomen.

**Overeenkomsten:**

- Beide regelmethoden kunnen gebruikt worden voor het aansturen van dynamische systemen.
- Beide maken gebruik van foutsignalen (in NN’s impliciet tijdens het trainen).
- Beide kunnen met feedback werken om de systeemoutput te corrigeren.
- Beide vereisen afstemming of training om goed te presteren in een specifieke toepassing.

In veel gevallen kan een neuraal netwerk zelfs worden getraind om het gedrag van een PID-regelaar na te bootsen, wat de basis vormt voor het vervangen of verbeteren van klassieke regelsystemen met AI-gebaseerde methoden.

### 2.4 Keuze van netwerkarchitecturen (Feedforward vs Recurrent)

Voor deze toepassing, waarbij het gedrag van een systeem over de tijd belangrijk is (zoals bij een regelkring), kan een recurrent neuraal netwerk (RNN) zeer geschikt zijn. Een RNN is ontworpen om sequentiële data te verwerken door interne toestanden (geheugen) bij te houden, wat betekent dat het in staat is om tijdsafhankelijke relaties te leren herkennen — cruciaal bij dynamische systemen.

Binnen de klasse van recurrente netwerken zijn er varianten zoals LSTM (Long Short-Term Memory) en GRU (Gated Recurrent Unit), die beide ontworpen zijn om het probleem van ‘vergeten’ over lange tijdsintervallen te verhelpen.

- **Voor gebruik op een computer** is een **LSTM-netwerk** doorgaans de beste keuze. LSTM’s kunnen langere temporele afhankelijkheden leren en zijn krachtiger bij complexe systemen, mits er voldoende rekenkracht en geheugen beschikbaar is.

- **Voor implementatie op een microcontroller** is een **GRU-netwerk** beter geschikt. GRU’s zijn eenvoudiger van structuur, waardoor ze minder geheugen en rekencapaciteit vereisen, terwijl ze toch goede prestaties leveren voor veel toepassingen.

Hoewel feedforward netwerken eenvoudiger zijn en sneller te trainen, missen ze het geheugenmechanisme dat nodig is voor het modelleren van tijdsafhankelijke gedragingen. Daarom heeft een recurrent netwerk hier de voorkeur.

## 3. Onderzoeksmethodologie

### 3.1 Simulatieomgeving en uitgangspunten

Voor het maken en trainen van het neurale netwerk zijn er verschillende frameworks beschikbaar, waarvan TensorFlow en PyTorch de meest gangbare zijn.

**TensorFlow** is een open-source machine learning framework ontwikkeld door Google. Het is gericht op zowel onderzoek als productie, en wordt veel gebruikt voor deep learning toepassingen. TensorFlow biedt ondersteuning voor training en inferentie op verschillende platformen, waaronder embedded systemen. Voor dit project is TensorFlow relevant omdat de gekozen microcontroller (NXP FRDM-MCXN947) ondersteuning biedt voor TensorFlow Lite – een lichtere versie van TensorFlow die geoptimaliseerd is voor embedded toepassingen. Hierdoor is het mogelijk om getrainde modellen in een beperkte omgeving efficiënt uit te voeren.

Naast TensorFlow is ook **PyTorch** overwogen. PyTorch is een open-source machine learning bibliotheek ontwikkeld door Facebook's AI Research-lab. Het wordt veel gebruikt in onderzoek vanwege de flexibiliteit en de intuïtieve manier van modelleren. PyTorch maakt gebruik van dynamische computation graphs, wat betekent dat het model op elk moment aangepast kan worden tijdens het trainen, wat het debuggen en experimenteren vereenvoudigt.

Tijdens het onderzoek is PyTorch ook daadwerkelijk getest door een simpel feedforward neuraal netwerk te bouwen dat handgeschreven cijfers herkent (digit recognition). Dit diende als proof-of-concept om bekend te raken met netwerkarchitecturen en het trainen van modellen. Hoewel deze test succesvol was, is uiteindelijk gekozen om verder te werken met TensorFlow vanwege de directe compatibiliteit met het embedded platform.


### 3.2 Verzameling van trainingsdata

### 3.3 Netwerkarchitectuur en configuratie

### 3.4 Trainingsstrategie en hyperparameter tuning



### 3.5 Validatiemethoden en evaluatiecriteria

## 4. Resultaten

### 4.1 Resultaten van het getrainde model (loss, performance)

### 4.2 Vergelijking met de PID-regelaar

### 4.3 Effect van variatie in data / robuustheid

### 4.4 Observaties tijdens simulatie

## 5. Discussie

### 5.1 Interpretatie van de resultaten

### 5.2 Beperkingen van het model

### 5.3 Lessen en inzichten

### 5.4 Reflectie op de aanpak

## 6. Conclusie en aanbevelingen

### 6.1 Beantwoording van de hoofdvraag

### 6.2 Samenvatting van de belangrijkste bevindingen

### 6.3 Aanbevelingen voor implementatie (Team 2)

### 6.4 Suggesties voor vervolgonderzoek

## 7. Bronnenlijst

## 8. Bijlagen

- Uitleg van de gebruikte dataformaten
- Overzicht van code/configuraties
- Extra grafieken of simulaties