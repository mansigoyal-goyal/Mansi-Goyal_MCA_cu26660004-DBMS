"""
Q10 - MongoDB query practice displayed through Flask.
 (a) category = X            {"category": X}
 (b) price > 50              {"price": {"$gt": 50}}
 (c) price < 100             {"price": {"$lt": 100}}
 (d) stock < 30              {"stock": {"$lt": 30}}
 (e) manufacturer = X        {"manufacturer": X}
 (f) sort by price           find().sort("price", 1 / -1)
 (g) sort by stock           find().sort("stock", 1 / -1)
Run:  python app.py     -> http://127.0.0.1:5000/
"""
from flask import Flask, render_template, request
from pymongo import MongoClient, ASCENDING, DESCENDING

app = Flask(__name__)
medicines = MongoClient("mongodb://localhost:27017/")["HospitalDB"]["medicines"]
NO_ID = {"_id": 0}


def show(title, query_text, cursor):
    return render_template("queries.html", title=title, query_text=query_text, results=list(cursor))


@app.route("/")
def home():
    return render_template("queries.html", title=None, results=None, query_text=None)


@app.route("/category")
def by_category():
    c = request.args.get("category", "").strip()
    return show(f"(a) Category: {c}", f'db.medicines.find({{"category": "{c}"}})',
                medicines.find({"category": c}, NO_ID))


@app.route("/price-above-50")
def price_gt_50():
    return show("(b) Price more than Rs.50", 'db.medicines.find({"price": {"$gt": 50}})',
                medicines.find({"price": {"$gt": 50}}, NO_ID))


@app.route("/price-below-100")
def price_lt_100():
    return show("(c) Price less than Rs.100", 'db.medicines.find({"price": {"$lt": 100}})',
                medicines.find({"price": {"$lt": 100}}, NO_ID))


@app.route("/stock-below-30")
def stock_lt_30():
    return show("(d) Stock less than 30", 'db.medicines.find({"stock": {"$lt": 30}})',
                medicines.find({"stock": {"$lt": 30}}, NO_ID))


@app.route("/manufacturer")
def by_manufacturer():
    m = request.args.get("manufacturer", "").strip()
    return show(f"(e) Manufacturer: {m}", f'db.medicines.find({{"manufacturer": "{m}"}})',
                medicines.find({"manufacturer": m}, NO_ID))


@app.route("/sort-price")
def sort_price():
    order = DESCENDING if request.args.get("order") == "desc" else ASCENDING
    return show(f"(f) Sorted by price ({'high to low' if order == DESCENDING else 'low to high'})",
                f'db.medicines.find().sort("price", {order})',
                medicines.find({}, NO_ID).sort("price", order))


@app.route("/sort-stock")
def sort_stock():
    order = DESCENDING if request.args.get("order") == "desc" else ASCENDING
    return show(f"(g) Sorted by stock ({'high to low' if order == DESCENDING else 'low to high'})",
                f'db.medicines.find().sort("stock", {order})',
                medicines.find({}, NO_ID).sort("stock", order))


if __name__ == "__main__":
    app.run(debug=True)
