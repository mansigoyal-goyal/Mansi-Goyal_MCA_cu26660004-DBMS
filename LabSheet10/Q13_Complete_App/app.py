"""
Q13 - Complete Hospital Medicine Management System
HTML -> Flask -> PyMongo -> MongoDB -> Document

Features : Home, Add Medicine, View Medicines, Search Medicine, Update Stock,
           Delete Medicine, Low Stock, Inventory Report
Run      : python app.py     -> http://127.0.0.1:5000/
"""
import re
from flask import Flask, render_template, request
from pymongo import MongoClient

app = Flask(__name__)
medicines = MongoClient("mongodb://localhost:27017/")["HospitalDB"]["medicines"]
NO_ID = {"_id": 0}
LOW_STOCK_LIMIT = 30


# ---------------- Home ----------------
@app.route("/")
def home():
    return render_template("home.html", total=medicines.count_documents({}),
                           low=medicines.count_documents({"stock": {"$lt": LOW_STOCK_LIMIT}}))


# ---------------- Add ----------------
@app.route("/add", methods=["GET", "POST"])
def add_medicine():
    if request.method == "POST":
        mid = int(request.form["medicine_id"])
        if medicines.find_one({"medicine_id": mid}):
            return render_template("add.html", msg=f"Medicine ID {mid} already exists!", ok=False)
        doc = {
            "medicine_id": mid,
            "name": request.form["name"].strip(),
            "category": request.form["category"].strip(),
            "price": float(request.form["price"]),
            "stock": int(request.form["stock"]),
            "manufacturer": request.form["manufacturer"].strip(),
        }
        # optional embedded supplier document
        s_name = request.form.get("supplier_name", "").strip()
        if s_name:
            doc["supplier"] = {"name": s_name,
                               "phone": request.form.get("supplier_phone", "").strip(),
                               "city": request.form.get("supplier_city", "").strip()}
        medicines.insert_one(doc)
        return render_template("add.html", msg=f"Medicine '{doc['name']}' added successfully!", ok=True)
    return render_template("add.html")


# ---------------- View (with sorting / filtering) ----------------
@app.route("/medicines")
def view_medicines():
    sort_by = request.args.get("sort")            # price | stock
    order = -1 if request.args.get("order") == "desc" else 1
    category = request.args.get("category", "").strip()
    query = {"category": category} if category else {}
    cursor = medicines.find(query, NO_ID)
    if sort_by in ("price", "stock"):
        cursor = cursor.sort(sort_by, order)
    categories = sorted(medicines.distinct("category"))
    return render_template("view.html", medicines=list(cursor), categories=categories,
                           selected=category, limit=LOW_STOCK_LIMIT)


# ---------------- Search ----------------
@app.route("/search", methods=["GET", "POST"])
def search_medicine():
    results, searched, term = [], False, ""
    if request.method == "POST":
        searched = True
        term = request.form["term"].strip()
        conditions = [{"name": {"$regex": re.escape(term), "$options": "i"}}]
        if term.isdigit():
            conditions.append({"medicine_id": int(term)})
        results = list(medicines.find({"$or": conditions}, NO_ID))
    return render_template("search.html", results=results, searched=searched, term=term)


# ---------------- Update stock ----------------
@app.route("/update-stock", methods=["GET", "POST"])
def update_stock():
    msg, ok, medicine = None, False, None
    if request.method == "POST":
        mid = int(request.form["medicine_id"])
        result = medicines.update_one({"medicine_id": mid},
                                      {"$set": {"stock": int(request.form["new_stock"])}})
        if result.matched_count:
            msg, ok = "Stock updated successfully!", True
            medicine = medicines.find_one({"medicine_id": mid}, NO_ID)
        else:
            msg = f"No medicine found with ID {mid}."
    return render_template("update_stock.html", msg=msg, ok=ok, medicine=medicine)


# ---------------- Delete ----------------
@app.route("/delete", methods=["GET", "POST"])
def delete_medicine():
    msg, ok = None, False
    if request.method == "POST":
        mid = int(request.form["medicine_id"])
        if medicines.delete_one({"medicine_id": mid}).deleted_count:
            msg, ok = f"Medicine {mid} deleted successfully.", True
        else:
            msg = f"No medicine found with ID {mid}."
    return render_template("delete.html", msg=msg, ok=ok)


# ---------------- Low stock ----------------
@app.route("/low-stock")
def low_stock():
    limit = int(request.args.get("limit", LOW_STOCK_LIMIT))
    data = list(medicines.find({"stock": {"$lt": limit}}, NO_ID).sort("stock", 1))
    return render_template("low_stock.html", medicines=data, limit=limit)


# ---------------- Inventory report ----------------
@app.route("/report")
def report():
    agg = list(medicines.aggregate([{"$group": {"_id": None, "total": {"$sum": "$stock"}}}]))
    return render_template(
        "report.html",
        total_medicines=medicines.count_documents({}),
        total_stock=agg[0]["total"] if agg else 0,
        low_stock=list(medicines.find({"stock": {"$lt": LOW_STOCK_LIMIT}}, NO_ID).sort("stock", 1)),
        limit=LOW_STOCK_LIMIT,
        most_expensive=medicines.find_one({}, NO_ID, sort=[("price", -1)]),
        cheapest=medicines.find_one({}, NO_ID, sort=[("price", 1)]),
    )


if __name__ == "__main__":
    app.run(debug=True)
