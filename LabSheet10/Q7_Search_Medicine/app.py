"""
Q7 - Search a medicine by Medicine ID or Medicine Name.
Run:  python app.py     -> http://127.0.0.1:5000/
"""
import re
from flask import Flask, render_template, request
from pymongo import MongoClient

app = Flask(__name__)
medicines = MongoClient("mongodb://localhost:27017/")["HospitalDB"]["medicines"]


@app.route("/", methods=["GET", "POST"])
def search():
    results, searched, term = [], False, ""
    if request.method == "POST":
        searched = True
        term = request.form["term"].strip()
        conditions = [{"name": {"$regex": re.escape(term), "$options": "i"}}]   # name (case-insensitive)
        if term.isdigit():
            conditions.append({"medicine_id": int(term)})                       # id
        results = list(medicines.find({"$or": conditions}, {"_id": 0}))
    return render_template("search.html", results=results, searched=searched, term=term)


if __name__ == "__main__":
    app.run(debug=True)
