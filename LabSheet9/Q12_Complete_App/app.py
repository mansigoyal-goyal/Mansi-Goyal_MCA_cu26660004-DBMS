"""
Q12 - Complete Student Record Management System
HTML -> Flask -> PyMongo -> MongoDB -> Document

Features : Add, View, Search, Update, Delete (+ Filters from Q11)
Run      : python app.py     -> http://127.0.0.1:5000/
"""
from flask import Flask, render_template, request
from pymongo import MongoClient

app = Flask(__name__)
students = MongoClient("mongodb://localhost:27017/")["CollegeDB"]["students"]
NO_ID = {"_id": 0}


# ---------------- Home ----------------
@app.route("/")
def home():
    return render_template("home.html", total=students.count_documents({}))


# ---------------- Add ----------------
@app.route("/add", methods=["GET", "POST"])
def add_student():
    if request.method == "POST":
        sid = request.form["student_id"].strip()
        if students.find_one({"student_id": sid}):
            return render_template("add.html", msg=f"Student ID {sid} already exists!", ok=False)
        students.insert_one({
            "student_id": sid,
            "name": request.form["name"].strip(),
            "age": int(request.form["age"]),
            "gender": request.form["gender"],
            "department": request.form["department"].strip(),
            "marks": float(request.form["marks"]),
        })
        return render_template("add.html", msg="Student added successfully!", ok=True)
    return render_template("add.html")


# ---------------- View ----------------
@app.route("/students")
def view_students():
    return render_template("view.html", students=list(students.find({}, NO_ID)))


# ---------------- Search ----------------
@app.route("/search", methods=["GET", "POST"])
def search_student():
    student, searched, sid = None, False, ""
    if request.method == "POST":
        searched = True
        sid = request.form["student_id"].strip()
        student = students.find_one({"student_id": sid}, NO_ID)
    return render_template("search.html", student=student, searched=searched, sid=sid)


# ---------------- Update ----------------
@app.route("/update", methods=["GET", "POST"])
def find_for_update():
    if request.method == "POST":
        sid = request.form["student_id"].strip()
        student = students.find_one({"student_id": sid}, NO_ID)
        if student:
            return render_template("update.html", student=student)
        return render_template("find_update.html", msg=f"No student found with ID {sid}.")
    return render_template("find_update.html")


@app.route("/update/save", methods=["POST"])
def save_update():
    sid = request.form["student_id"]
    students.update_one({"student_id": sid}, {"$set": {
        "name": request.form["name"].strip(),
        "age": int(request.form["age"]),
        "department": request.form["department"].strip(),
        "marks": float(request.form["marks"]),
    }})
    return render_template("update.html", student=students.find_one({"student_id": sid}, NO_ID),
                           msg="Student updated successfully!")


# ---------------- Delete ----------------
@app.route("/delete", methods=["GET", "POST"])
def delete_student():
    msg, ok = None, False
    if request.method == "POST":
        sid = request.form["student_id"].strip()
        if students.delete_one({"student_id": sid}).deleted_count:
            msg, ok = f"Student {sid} deleted successfully.", True
        else:
            msg = f"No student found with ID {sid}."
    return render_template("delete.html", msg=msg, ok=ok)


# ---------------- Filters (Q11) ----------------
@app.route("/filter")
def filter_students():
    kind = request.args.get("type")
    title, query = None, None
    if kind == "department":
        d = request.args.get("department", "").strip()
        title, query = f"Department: {d}", {"department": d}
    elif kind == "marks_gt":
        title, query = "Marks greater than 75", {"marks": {"$gt": 75}}
    elif kind == "marks_between":
        lo, hi = float(request.args.get("low", 50)), float(request.args.get("high", 80))
        title, query = f"Marks between {lo:g} and {hi:g}", {"marks": {"$gte": lo, "$lte": hi}}
    elif kind == "age_gt":
        title, query = "Students older than 20", {"age": {"$gt": 20}}
    results = list(students.find(query, NO_ID)) if query is not None else None
    return render_template("filter.html", title=title, query=query, results=results)


if __name__ == "__main__":
    app.run(debug=True)
