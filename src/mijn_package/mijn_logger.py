# mijn_logger.py

import logging

def setup_logger(
    logfile: str = 'OUTPUT.log',
    loglevel: int = logging.DEBUG
) -> logging.Logger:
    """
    Zet een logger op die naar zowel console als bestand logt.
    
    Args:
        logfile (str): De naam van het logbestand.
        loglevel (int): Minimale loglevel die gelogd moet worden.
        
    Returns:
        logging.Logger: De geconfigureerde logger.
    """
    logger = logging.getLogger('MijnLogger')
    logger.setLevel(loglevel)

    # Log naar bestand
    file_handler = logging.FileHandler(logfile, mode='w')
    file_handler.setFormatter(logging.Formatter('%(message)s'))
    logger.addHandler(file_handler)
    
    # Log naar console (zoals print)
    console_handler = logging.StreamHandler()
    console_handler.setFormatter(logging.Formatter('%(message)s'))
    logger.addHandler(console_handler)


    return logger