import random
import matplotlib.pyplot as plt
from matplotlib.widgets import Slider
import matplotlib.animation as animation
import csv
import atexit
# Simulatieparameters
dt = 0.01  # tijdstap (s)
h_min = 0.05  # minimale doelhoogte (m)
h_max = 1.0   # maximale doelhoogte (m)




max_random_updates = 100+1  # maximaal aantal keren dat de doelhoogte willekeurig aangepast wordt
random_update_count = 0  # teller
update_interval = 10  # tijd in seconden tussen automatische doelhoogte-aanpassingen


# Simulatieduur printen
def print_simulatieduur(max_updates, interval):
    totaal_seconden = max_updates * interval
    dagen = totaal_seconden // (24 * 3600)
    resterend = totaal_seconden % (24 * 3600)
    uren = resterend // 3600
    resterend %= 3600
    minuten = resterend // 60
    seconden = resterend % 60
    print(f"Simulatieduur: {int(dagen)} dagen, {int(uren)} uur, {int(minuten)} minuten, {int(seconden)} seconden")

print_simulatieduur(max_random_updates, update_interval)

# Fysieke constanten
g = 9.81          # zwaartekracht (m/s^2)
m = 0.0027        # massa pingpongbal (kg)
C = 50           # gecombineerde constante (afhankelijk van ventilator, vorm, enz.)

Kp = 6.0
Ki = 3.0
Kd = 1.0

# Reset variabelen
h = 0.0
v = 0.0
e_prev = 0.0
e_sum = 0.0

h_vals = []
u_vals = []
time_vals = []
h_target_vals = []
e_vals = []
e_sum_vals = []
de_vals = []

# Functie om data naar CSV te schrijven
def save_to_csv():
    with open('simulatie_resultaten.csv', 'w', newline='') as csvfile:
        writer = csv.writer(csvfile)
        writer.writerow(['Tijd (s)', 'Setpoint (m)', 'Hoogte (m)', 'Fout', 'Fout_Integratie', 'Fout_Afgeleide', 'PWM'])
        for t, setp, h_val, e, e_s, d, u_val in zip(time_vals, h_target_vals, h_vals, e_vals, e_sum_vals, de_vals, u_vals):
            writer.writerow([f"{t:.6f}", f"{setp:.6f}", f"{h_val:.6f}", f"{e:.6f}", f"{e_s:.6f}", f"{d:.6f}", f"{u_val:.6f}"])

# Startwaarde doelhoogte
h_target = 0.3

def run_simulatie_versneld():
    global h, v, e_prev, e_sum, h_target, random_update_count
    t = 0.0
    while random_update_count < max_random_updates:
        if int(t // update_interval) != int((t - dt) // update_interval):
            h_target = random.uniform(h_min, h_max)
            random_update_count += 1
            print(f"counter {random_update_count}")

        e = h_target - h
        e_sum += e * dt
        de = (e - e_prev) / dt
        u = Kp * e + Ki * e_sum + Kd * de
        e_prev = e
        e_vals.append(e)
        e_sum_vals.append(e_sum)
        de_vals.append(de)
        u = max(0.0, min(1.0, u))

        a = C * u**2 - g
        v += a * dt
        h += v * dt

        if h < 0:
            h = 0
            v = 0

        h_vals.append(h)
        u_vals.append(u)
        time_vals.append(t)
        h_target_vals.append(h_target)

        t += dt

versneld = False  # Zet op False als je de animatie wilt gebruiken
if versneld:
    run_simulatie_versneld()
    save_to_csv()
    exit()

# Voor real-time simulatie met aanpasbare doelhoogte
def update(frame):
    global h, v, e_prev, e_sum, h_target, random_update_count

    t = frame * dt
    # Verander de doelhoogte automatisch elke 10 seconden, tenzij de gebruiker de slider gebruikt
    if int(t // update_interval) != int((t - dt) // update_interval):
        if random_update_count < max_random_updates:
            slider.set_val(random.uniform(h_min, h_max))
            random_update_count += 1
        else:
            plt.close()
            return

    h_target = slider.val  # Laat de slider de waarde bepalen

    # PID-controller
    e = h_target - h
    e_sum += e * dt
    de = (e - e_prev) / dt
    u = Kp * e + Ki * e_sum + Kd * de
    e_prev = e
    e_vals.append(e)
    e_sum_vals.append(e_sum)
    de_vals.append(de)
    u = max(0.0, min(1.0, u))

    # Modelupdate
    a = C * u**2 - g
    v += a * dt
    h += v * dt

    if h < 0:
        h = 0
        v = 0

    # Log gegevens
    h_vals.append(h)
    u_vals.append(u)
    time_vals.append(t)
    h_target_vals.append(h_target)

    # Update grafieken
    ax1.clear()
    ax1.set_title("Hoogte van de pingpongbal (real-time)")
    ax1.set_xlabel("Tijd (s)")
    ax1.set_ylabel("Hoogte (m)")
    ax1.set_xlim(max(0, t - 5), t + 0.1)
    margin = 0.05
    min_h = max(0, min(h_vals[-100:]) - margin) if h_vals else 0
    max_h = max(h_vals[-100:]) + margin if h_vals else 0.5
    ax1.set_ylim(min_h, max_h)
    ax1.plot(time_vals, h_vals, color='blue')
    ax1.axhline(h_target, color='gray', linestyle='--', label='Doelhoogte')
    ax1.text(0.75, 0.9, f"Doelhoogte: {h_target:.3f} m", transform=ax1.transAxes, fontsize=10,
             verticalalignment='top', bbox=dict(boxstyle="round", facecolor="white", alpha=0.5))
    ax1.legend()

    ax2.clear()
    ax2.set_title("PWM-signaal (real-time)")
    ax2.set_xlabel("Tijd (s)")
    ax2.set_ylabel("PWM")
    ax2.set_xlim(max(0, t - 5), t + 0.1)
    ax2.set_ylim(0, 1)
    ax2.plot(time_vals, u_vals, color='red')

    # Voeg hoogte en PWM-waarden als tekst toe aan de grafieken
    ax1.text(0.02, 0.9, f"Hoogte: {h:.9f} m", transform=ax1.transAxes, fontsize=10,
             verticalalignment='top', bbox=dict(boxstyle="round", facecolor="white", alpha=0.5))
    ax2.text(0.02, 0.9, f"PWM: {u:.9f}", transform=ax2.transAxes, fontsize=10,
             verticalalignment='top', bbox=dict(boxstyle="round", facecolor="white", alpha=0.5))

# Maak figuur en subplots
fig, (ax1, ax2) = plt.subplots(2, 1, figsize=(8, 6))
plt.subplots_adjust(bottom=0.2)

# Slider toevoegen voor h_target
ax_slider = plt.axes([0.2, 0.05, 0.6, 0.03])
slider = Slider(ax_slider, 'Doelhoogte (m)', h_min, h_max, valinit=h_target)

# Start animatie
ani = animation.FuncAnimation(fig, update, interval=dt*1000)
atexit.register(save_to_csv)
plt.show()