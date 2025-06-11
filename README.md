# Mijn Project

Een professioneel opgezet Python-project, gemaakt met een duidelijke structuur en moderne best practices.

## Inhoud

- [Mijn Project](#mijn-project)
  - [Inhoud](#inhoud)
  - [Over dit project](#over-dit-project)
  - [Structuur](#structuur)
  - [Installatie](#installatie)
  - [Gebruik](#gebruik)
  - [Testen](#testen)
  - [Ontwikkeling](#ontwikkeling)
  - [Configuratiebestanden](#configuratiebestanden)
  - [Licentie](#licentie)

## Over dit project

Dit project is een voorbeeldopzet voor een Python-applicatie met:

- Strikte scheiding tussen code (`src/`) en tests (`tests/`)
- Moderne configuratie (`pyproject.toml`, `setup.cfg`)
- Automatische codeformatting met **Black** en **Flake8**
- Unittests met **unittest** of **pytest**

## Structuur

```bash
mijn_project/
├── main.py
├── pyproject.toml
├── setup.cfg
├── requirements.txt
├── README.md
├── /src/
│   └── mijn_package/
│       ├── __init__.py
│       ├── hulpfuncties.py
│       └── berekeningen.py
└── /tests/
    └── test_berekeningen.py
```

## Installatie

1. Clone deze repository:

   ```bash
   git clone https://github.com/jouwgebruikersnaam/mijn_project.git
   cd mijn_project
   ```

2. (Aanbevolen) Maak een virtuele omgeving aan:

   ```bash
   python3 -m venv .venv
   source .venv/bin/activate  # Linux/Mac
   .venv\Scripts\activate     # Windows
   ```

3. Installeer afhankelijkheden:

   ```bash
   pip install -r requirements.txt
   ```

4. Installeer het project in ontwikkelmodus:

   ```bash
   pip install -e .
   ```

## Gebruik

Voer het project uit met:

```bash
python main.py
```

## Testen

Voer de unittests uit:

```bash
pytest
```

(of)

```bash
python -m unittest discover -s tests
```

## Ontwikkeling

Tijdens ontwikkeling kun je automatisch formatteren en controleren:

- Format code:

  ```bash
  black .
  ```

- Controleer code-stijl:

  ```bash
  flake8 .
  ```

## Configuratiebestanden

| Bestand           | Doel |
|--------------------|------|
| `pyproject.toml`   | Build-systeem en basis-instellingen voor pip/poetry/etc. |
| `setup.cfg`        | Gedetailleerde projectconfiguratie (installatie, flake8, pytest) |
| `requirements.txt` | Lijst van benodigde externe libraries |

## Licentie

Dit project is gelicenseerd onder de MIT-licentie.
Zie het bestand `LICENSE` voor details.

---

> **Opmerking:** Deze projectstructuur is future-proof en geschikt voor kleine tot grote Python-projecten.
