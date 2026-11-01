"""
Q8 - Search a student by Student ID using MongoDB find_one().
Run:  python app.py     -> http://127.0.0.1:5000/
"""
from flask import Flask, render_template, request
from pymongo import MongoClient

app = Flask(__name__)
students = MongoClient("mongodb://localhost:27017/")["CollegeDB"]["students"]


@app.route("/", methods=["GET", "POST"])
def search():
    student, searched, sid = None, False, ""
    if request.method == "POST":
        searched = True
        sid = request.form["student_id"].strip()
        student = students.find_one({"student_id": sid}, {"_id": 0})
    return render_template("search.html", student=student, searched=searched, sid=sid)


if __name__ == "__main__":
    app.run(debug=True)
