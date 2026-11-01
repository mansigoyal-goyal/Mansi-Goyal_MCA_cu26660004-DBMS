"""
Q11 - MongoDB filtering queries displayed through Flask.
  (a) department = X            -> {"department": X}
  (b) marks > 75                -> {"marks": {"$gt": 75}}
  (c) 50 <= marks <= 80         -> {"marks": {"$gte": 50, "$lte": 80}}
  (d) age > 20                  -> {"age": {"$gt": 20}}
Run:  python app.py     -> http://127.0.0.1:5000/
"""
from flask import Flask, render_template, request
from pymongo import MongoClient

app = Flask(__name__)
students = MongoClient("mongodb://localhost:27017/")["CollegeDB"]["students"]
NO_ID = {"_id": 0}


def show(title, query):
    results = list(students.find(query, NO_ID))
    return render_template("filter.html", title=title, query=query, results=results)


@app.route("/")
def home():
    return render_template("filter.html", title=None, results=None, query=None)


@app.route("/department")
def by_department():
    dept = request.args.get("department", "").strip()
    return show(f"(a) Students in department: {dept}", {"department": dept})


@app.route("/marks-above-75")
def marks_gt_75():
    return show("(b) Students with marks > 75", {"marks": {"$gt": 75}})


@app.route("/marks-between")
def marks_between():
    low = float(request.args.get("low", 50))
    high = float(request.args.get("high", 80))
    return show(f"(c) Students with marks between {low:g} and {high:g}",
                {"marks": {"$gte": low, "$lte": high}})


@app.route("/age-above-20")
def age_gt_20():
    return show("(d) Students older than 20", {"age": {"$gt": 20}})


if __name__ == "__main__":
    app.run(debug=True)
