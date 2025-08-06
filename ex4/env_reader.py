from dotenv import load_dotenv
import os

load_dotenv()
print("MESAJ din .env:", os.getenv("MESAJ"))