import cmd
from mijn_package.config import CSV_PATH
import pandas as pd

class MyCLI(cmd.Cmd):
    intro = "Welkom bij de CLI. Typ 'help' of '?' voor een lijst met commando's."
    prompt = ">>>> "

    def do_hello(self, arg):
        "Zegt hallo tegen de gebruiker: hello [naam]"
        if arg:
            print(f"Hallo, {arg}!")
        else:
            print("Hallo!")

    def do_exit(self, arg):
        "CLI afsluiten"
        print("Tot ziens!")
        return True

    def do_add(self, arg):
        "Voegt twee getallen toe: add 5 7"
        try:
            numbers = arg.split()
            result = sum(map(float, numbers))
            print(f"Resultaat: {result}")
        except Exception as e:
            print(f"Fout: {e}")
    def do_printCSV(self, arg):
        "Print de inhoud van een CSV-bestand: printCSV bestandsnaam.csv"
        CSV_data = pd.read_csv(CSV_PATH)
        print(f"CSV-bestand '{CSV_PATH}' succesvol ingelezen.")
        print(CSV_data)  


    # Je kunt hier zelf nieuwe commando's toevoegen!
    # Definieer simpelweg een nieuwe `do_` functie.

def start_cli():
    MyCLI().cmdloop()