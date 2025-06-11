opstelling 16 

PWM 45 tot 46% blijft het stedi

19 juni documentatie

10 juli




rob en martijn van den willigen een mail sturen voor de datalab met context wat we nodig.

numeriacel resepies



eerste inderatie trainenn met pid vervolgens verbeteren
PID perfecte situatie
opstelling eigenschapen
true/false
PID curve
PID
PID verschillende tuning mogelijk heden

# PID Perfecte situatie



# Opstelling eigenschappen

# true/false

# 🎯 PID-regelaar als trainingsdata voor een neuraal netwerk (NN)

In dit document leggen we uit hoe je gegevens van een klassieke PID-regelaar gebruikt om een neuraal netwerk te trainen dat het gedrag van de regelaar kan nabootsen.

---

## 📐 PID-regelwet

Een PID-regelaar stuurt op basis van de fout tussen een gewenste waarde (setpoint) en een gemeten waarde (bijv. hoogte). De formule is:

$$
u(t) = K_P \cdot e(t) + K_I \cdot \int_0^t e(\tau) d\tau + K_D \cdot \frac{de(t)}{dt}
$$

waarbij:

- $u(t)$: de uitgaande stuurwaarde (bijv. PWM)
- $e(t)$: de fout, oftewel $ \text{setpoint} - \text{meting} $
- $K_P$, $K_I$, $K_D$: respectievelijke versterkingsfactoren

---

## 🔣 Berekening in discrete tijd (code)

In een digitaal systeem werk je met een sampletijd \( \Delta t \). De PID-termen worden dan benaderd als:

- **Proportioneel (P):**
  $$
  P = e(t)
  $$
- **Integrerend (I):**
  $$
  I = I(t-1) + e(t) \cdot \Delta t
  $$
- **Afgeleide (D):**
  $$
  D = \frac{e(t) - e(t-1)}{\Delta t}
  $$

### 📦 Codevoorbeeld

```python
# Parameters
setpoint = 20.0              # gewenste hoogte in cm
hoogte = 18.5                # gemeten hoogte in cm
dt = 0.05                    # tijdstap in seconden

# PID-berekening
e = setpoint - hoogte        # fout
sum_e += e * dt              # integraalterm (accumulatie)
D = (e - vorige_e) / dt      # afgeleide fout
vorige_e = e                 # update voor volgende stap```



tijd,setpoint,hoogte,fout,fout_integr, fout_diff, pwm


0.00,20.0,18.5,1.5,0.0,0.0,123
0.05,20.0,19.0,1.0,0.075,-10.0,126
0.10,20.0,19.3,0.7,0.125,-6.0,128
...