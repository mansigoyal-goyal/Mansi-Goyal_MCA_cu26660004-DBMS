"""
Q8 - Update the stock of a medicine using update_one() with $set.
Run:  python app.py     -> http://127.0.0.1:5000/
"""
from flask import Flask, render_template, request
from pymongo import MongoClient

app = Flask(__name__)
medicines = MongoClient("mongodb://localhost:27017/")["HospitalDB"]["medicines"]


@app.route("/", methods=["GET", "POST"])
def update_stock():
    msg, ok, medicine = None, False, None
    if request.method == "POST":
        mid = int(request.form["medicine_id"])
        new_stock = int(request.form["new_stock"])
        result = medicines.update_one({"medicine_id": mid}, {"$set": {"stock": new_stock}})
        if result.matched_count:
            msg, ok = "Stock updated successfully!", True
            medicine = medicines.find_one({"medicine_id": mid}, {"_id": 0})   # show updated document
        else:
            msg = f"No medicine found with ID {mid}."
    return render_template("update_stock.html", msg=msg, ok=ok, medicine=medicine)


if __name__ == "__main__":
    app.run(debug=True)
