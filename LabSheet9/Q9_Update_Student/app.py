"""
Q9 - Update Name, Age, Department and Marks using update_one() with $set.
Run:  python app.py     -> http://127.0.0.1:5000/
Flow: enter Student ID -> edit form (pre-filled) -> update -> updated document shown.
"""
from flask import Flask, render_template, request
from pymongo import MongoClient

app = Flask(__name__)
students = MongoClient("mongodb://localhost:27017/")["CollegeDB"]["students"]


@app.route("/", methods=["GET", "POST"])
def find_student():
    if request.method == "POST":
        sid = request.form["student_id"].strip()
        student = students.find_one({"student_id": sid}, {"_id": 0})
        if student:
            return render_template("update.html", student=student)
        return render_template("find.html", msg=f"No student found with ID {sid}.")
    return render_template("find.html")


@app.route("/update", methods=["POST"])
def update_student():
    sid = request.form["student_id"]
    new_values = {
        "name": request.form["name"].strip(),
        "age": int(request.form["age"]),
        "department": request.form["department"].strip(),
        "marks": float(request.form["marks"]),
    }
    students.update_one({"student_id": sid}, {"$set": new_values})
    updated = students.find_one({"student_id": sid}, {"_id": 0})   # verify
    return render_template("update.html", student=updated, msg="Student updated successfully! (Updated document shown below)")


if __name__ == "__main__":
    app.run(debug=True)
