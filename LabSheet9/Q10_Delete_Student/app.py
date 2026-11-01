"""
Q10 - Delete a student by Student ID using delete_one().
Run:  python app.py     -> http://127.0.0.1:5000/
"""
from flask import Flask, render_template, request
from pymongo import MongoClient

app = Flask(__name__)
students = MongoClient("mongodb://localhost:27017/")["CollegeDB"]["students"]


@app.route("/", methods=["GET", "POST"])
def delete_student():
    msg, ok = None, False
    if request.method == "POST":
        sid = request.form["student_id"].strip()
        result = students.delete_one({"student_id": sid})
        if result.deleted_count:
            msg, ok = f"Student {sid} deleted successfully.", True
        else:
            msg = f"No student found with ID {sid}."
    return render_template("delete.html", msg=msg, ok=ok, total=students.count_documents({}))


if __name__ == "__main__":
    app.run(debug=True)
