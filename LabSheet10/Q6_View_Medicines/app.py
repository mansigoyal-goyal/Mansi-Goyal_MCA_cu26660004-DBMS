"""
Q6 - Retrieve all medicines from MongoDB and display them in an HTML table.
Run:  python app.py     -> http://127.0.0.1:5000/
"""
from flask import Flask, render_template
from pymongo import MongoClient

app = Flask(__name__)
medicines = MongoClient("mongodb://localhost:27017/")["HospitalDB"]["medicines"]


@app.route("/")
def view_medicines():
    all_medicines = list(medicines.find({}, {"_id": 0}))
    return render_template("view_medicines.html", medicines=all_medicines)


if __name__ == "__main__":
    app.run(debug=True)
