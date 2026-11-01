"""
Q4 - Flask app connecting to HospitalDB.medicines and verifying the connection.
Run:  python Q4_app.py      then open http://127.0.0.1:5000/
"""
from flask import Flask
from pymongo import MongoClient
from pymongo.errors import ServerSelectionTimeoutError

app = Flask(__name__)

client = MongoClient("mongodb://localhost:27017/", serverSelectionTimeoutMS=3000)
db = client["HospitalDB"]
medicines = db["medicines"]


@app.route("/")
def home():
    try:
        client.admin.command("ping")           # verifies the connection
        count = medicines.count_documents({})
        return (f"<h1 style='color:green'>Successfully connected to MongoDB!</h1>"
                f"<p>Database: <b>HospitalDB</b> | Collection: <b>medicines</b> | "
                f"Documents: <b>{count}</b></p>")
    except ServerSelectionTimeoutError:
        return "<h1 style='color:red'>Could not connect to MongoDB. Is the server running?</h1>"


if __name__ == "__main__":
    app.run(debug=True)
