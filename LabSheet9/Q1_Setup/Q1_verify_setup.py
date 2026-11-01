"""
Q1 - Verify that Flask and PyMongo are installed and MongoDB is reachable.

Setup commands (run in VS Code terminal):
    python -m venv venv
    venv\Scripts\activate          (Windows)   |   source venv/bin/activate (Mac/Linux)
    pip install flask pymongo
Install MongoDB Community Server + MongoDB Compass from https://www.mongodb.com/try/download
Run:  python Q1_verify_setup.py
"""
import sys

print("Python version :", sys.version.split()[0])

try:
    import flask
    print("Flask          : imported successfully, version", flask.__version__ if hasattr(flask, "__version__") else "OK")
except ImportError:
    print("Flask import FAILED -> run: pip install flask")

try:
    import pymongo
    print("PyMongo        : imported successfully, version", pymongo.version)
except ImportError:
    print("PyMongo import FAILED -> run: pip install pymongo")
    sys.exit(1)

try:
    client = pymongo.MongoClient("mongodb://localhost:27017/", serverSelectionTimeoutMS=3000)
    client.admin.command("ping")
    print("MongoDB        : connected successfully, server version", client.server_info()["version"])
except Exception as e:
    print("MongoDB        : NOT reachable. Make sure the MongoDB service is running.")
    print("Details        :", e)
