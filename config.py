from pathlib import Path
import os

BASE_DIR = Path(__file__).resolve().parent
UPLOAD_DIR = BASE_DIR / "uploads"
DATABASE_PATH = BASE_DIR / "instance" / "admission.sqlite3"
MAX_CONTENT_LENGTH = 20 * 1024 * 1024
SECRET_KEY = os.environ.get("SECRET_KEY", "change-this-in-production")
