"""
Q7 - Retrieve all students from MongoDB and show them in an HTML table.
Run:  python app.py     -> http://127.0.0.1:5000/
"""
from flask import Flask, render_template
from pymongo import MongoClient

app = Flask(__name__)
students = MongoClient("mongodb://localhost:27017/")["CollegeDB"]["students"]


@app.route("/")
def view_students():
    all_students = list(students.find({}, {"_id": 0}))
    return render_template("view_students.html", students=all_students)


if __name__ == "__main__":
    app.run(debug=True)
