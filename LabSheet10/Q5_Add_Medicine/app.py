"""
Q5 - Connect the HTML medicine form to Flask and store the medicine in MongoDB.
Run:  python app.py     -> http://127.0.0.1:5000/
Verify: http://127.0.0.1:5000/verify  (or Compass / mongosh)
"""
from flask import Flask, render_template, request
from pymongo import MongoClient

app = Flask(__name__)
medicines = MongoClient("mongodb://localhost:27017/")["HospitalDB"]["medicines"]


@app.route("/")
def form():
    return render_template("add_medicine.html")


@app.route("/add", methods=["POST"])
def add_medicine():
    mid = int(request.form["medicine_id"])
    if medicines.find_one({"medicine_id": mid}):
        return render_template("add_medicine.html", msg=f"Medicine ID {mid} already exists!", ok=False)
    doc = {
        "medicine_id": mid,
        "name": request.form["name"].strip(),
        "category": request.form["category"].strip(),
        "price": float(request.form["price"]),
        "stock": int(request.form["stock"]),
        "manufacturer": request.form["manufacturer"].strip(),
    }
    medicines.insert_one(doc)
    return render_template("add_medicine.html", msg=f"Medicine '{doc['name']}' added successfully!", ok=True)


@app.route("/verify")
def verify():
    """Shows all documents so you can confirm the new medicine was stored."""
    return {"medicines": list(medicines.find({}, {"_id": 0}))}


if __name__ == "__main__":
    app.run(debug=True)
