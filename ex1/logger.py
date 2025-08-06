import logging
import time

logging.basicConfig(
    filename="/app/logs/activity.log",
    level=logging.INFO,
    format="%(asctime)s - %(message)s"
)

while True:
    logging.info("Mesaj logat automat la fiecare 3 secunde.")
    time.sleep(3)