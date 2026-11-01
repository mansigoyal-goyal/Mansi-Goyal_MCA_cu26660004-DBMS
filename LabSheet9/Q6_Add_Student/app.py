"""
Q6 - Connect HTML form with Flask and insert the student into MongoDB.
Run:  python app.py     -> http://127.0.0.1:5000/
Verify: open http://127.0.0.1:5000/verify  (or Compass / mongosh)
"""
from flask import Flask, render_template, request
from pymongo import MongoClient

app = Flask(__name__)
students = MongoClient("mongodb://localhost:27017/")["CollegeDB"]["students"]


@app.route("/")
def form():
    return render_template("add_student.html")


@app.route("/add", methods=["POST"])
def add_student():
    sid = request.form["student_id"].strip()
    if students.find_one({"student_id": sid}):
        return render_template("add_student.html", msg=f"Student ID {sid} already exists!", ok=False)

    doc = {
        "student_id": sid,
        "name": request.form["name"].strip(),
        "age": int(request.form["age"]),
        "gender": request.form["gender"],
        "department": request.form["department"].strip(),
        "marks": float(request.form["marks"]),
    }
    students.insert_one(doc)
    return render_template("add_student.html", msg=f"Student {doc['name']} added successfully!", ok=True)


@app.route("/verify")
def verify():
    """Shows all documents so you can confirm the new student was stored."""
    return {"students": list(students.find({}, {"_id": 0}))}


if __name__ == "__main__":
    app.run(debug=True)
