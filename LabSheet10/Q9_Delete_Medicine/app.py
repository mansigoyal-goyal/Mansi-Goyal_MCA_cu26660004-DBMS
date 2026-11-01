"""
Q9 - Delete a medicine by Medicine ID and verify it no longer exists.
Run:  python app.py     -> http://127.0.0.1:5000/
"""
from flask import Flask, render_template, request
from pymongo import MongoClient

app = Flask(__name__)
medicines = MongoClient("mongodb://localhost:27017/")["HospitalDB"]["medicines"]


@app.route("/", methods=["GET", "POST"])
def delete_medicine():
    msg, ok, verified = None, False, None
    if request.method == "POST":
        mid = int(request.form["medicine_id"])
        result = medicines.delete_one({"medicine_id": mid})
        if result.deleted_count:
            msg, ok = f"Medicine {mid} deleted successfully.", True
            # Verification: the document must no longer exist
            still_there = medicines.find_one({"medicine_id": mid})
            verified = "Verified: document no longer exists in MongoDB." if still_there is None \
                       else "Warning: document still exists!"
        else:
            msg = f"No medicine found with ID {mid}."
    return render_template("delete_medicine.html", msg=msg, ok=ok, verified=verified,
                           total=medicines.count_documents({}))


if __name__ == "__main__":
    app.run(debug=True)
