"""
Q11 (Step 2) - Display medicine + embedded supplier information through Flask.
Run:  python app.py     -> http://127.0.0.1:5000/
"""
from flask import Flask, render_template, request
from pymongo import MongoClient

app = Flask(__name__)
medicines = MongoClient("mongodb://localhost:27017/")["HospitalDB"]["medicines"]


@app.route("/")
def home():
    # only medicines that have an embedded supplier document
    data = list(medicines.find({"supplier": {"$exists": True}}, {"_id": 0}))
    return render_template("suppliers.html", medicines=data, title="Medicines with Supplier Information")


@app.route("/city")
def by_city():
    city = request.args.get("city", "").strip()
    data = list(medicines.find({"supplier.city": city}, {"_id": 0}))   # dot notation
    return render_template("suppliers.html", medicines=data, title=f"Suppliers from {city}")


if __name__ == "__main__":
    app.run(debug=True)
