"""
Q2 - Create database CollegeDB, collection students, insert 6 documents and verify.
Run:  python Q2_insert_students.py
(MongoDB creates the database/collection automatically on first insert.)
"""
from pymongo import MongoClient

client = MongoClient("mongodb://localhost:27017/")
db = client["CollegeDB"]
students = db["students"]

# Clear old data so the script can be re-run safely
students.delete_many({})

data = [
    {"student_id": "S101", "name": "Aarav Sharma", "age": 21, "gender": "Male",   "department": "MCA",  "marks": 85},
    {"student_id": "S102", "name": "Priya Singh",  "age": 20, "gender": "Female", "department": "MCA",  "marks": 72},
    {"student_id": "S103", "name": "Rohit Verma",  "age": 22, "gender": "Male",   "department": "BCA",  "marks": 64},
    {"student_id": "S104", "name": "Neha Gupta",   "age": 19, "gender": "Female", "department": "BTech","marks": 91},
    {"student_id": "S105", "name": "Karan Mehta",  "age": 23, "gender": "Male",   "department": "BCA",  "marks": 48},
    {"student_id": "S106", "name": "Anjali Rawat", "age": 21, "gender": "Female", "department": "MBA",  "marks": 78},
]

result = students.insert_many(data)
print(f"Inserted {len(result.inserted_ids)} documents.\n")

print("Verification - documents in CollegeDB.students:")
for doc in students.find({}, {"_id": 0}):
    print(doc)
print("\nTotal documents:", students.count_documents({}))
