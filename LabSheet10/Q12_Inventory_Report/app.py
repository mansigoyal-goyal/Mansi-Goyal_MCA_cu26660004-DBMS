"""
Q12 - Inventory report: total medicines, total stock, low stock, most expensive, cheapest.
Run:  python app.py     -> http://127.0.0.1:5000/
"""
from flask import Flask, render_template
from pymongo import MongoClient

app = Flask(__name__)
medicines = MongoClient("mongodb://localhost:27017/")["HospitalDB"]["medicines"]
NO_ID = {"_id": 0}
LOW_STOCK_LIMIT = 30


@app.route("/")
def report():
    total_medicines = medicines.count_documents({})

    agg = list(medicines.aggregate([{"$group": {"_id": None, "total": {"$sum": "$stock"}}}]))
    total_stock = agg[0]["total"] if agg else 0

    low_stock = list(medicines.find({"stock": {"$lt": LOW_STOCK_LIMIT}}, NO_ID).sort("stock", 1))
    most_expensive = medicines.find_one({}, NO_ID, sort=[("price", -1)])
    cheapest = medicines.find_one({}, NO_ID, sort=[("price", 1)])

    return render_template("report.html", total_medicines=total_medicines, total_stock=total_stock,
                           low_stock=low_stock, limit=LOW_STOCK_LIMIT,
                           most_expensive=most_expensive, cheapest=cheapest)


if __name__ == "__main__":
    app.run(debug=True)
