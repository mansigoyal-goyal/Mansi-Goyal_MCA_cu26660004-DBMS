"""
Q1 - Create HospitalDB, collection medicines, insert 8 documents and verify.
Run:  python Q1_insert_medicines.py
(MongoDB creates the database and collection automatically on first insert.)
"""
from pymongo import MongoClient

client = MongoClient("mongodb://localhost:27017/")
db = client["HospitalDB"]
medicines = db["medicines"]

medicines.delete_many({})          # allows safe re-running

data = [
    {"medicine_id": 301, "name": "Paracetamol",  "category": "Analgesic",     "price": 25,  "stock": 100, "manufacturer": "ABC Pharma"},
    {"medicine_id": 302, "name": "Amoxicillin",  "category": "Antibiotic",    "price": 120, "stock": 45,  "manufacturer": "MediCare Ltd"},
    {"medicine_id": 303, "name": "Ibuprofen",    "category": "Analgesic",     "price": 40,  "stock": 20,  "manufacturer": "HealWell Labs"},
    {"medicine_id": 304, "name": "Cetirizine",   "category": "Antihistamine", "price": 18,  "stock": 150, "manufacturer": "ABC Pharma"},
    {"medicine_id": 305, "name": "Azithromycin", "category": "Antibiotic",    "price": 95,  "stock": 25,  "manufacturer": "MediCare Ltd"},
    {"medicine_id": 306, "name": "Omeprazole",   "category": "Antacid",       "price": 60,  "stock": 80,  "manufacturer": "HealWell Labs"},
    {"medicine_id": 307, "name": "Metformin",    "category": "Antidiabetic",  "price": 55,  "stock": 12,  "manufacturer": "SunLife Pharma"},
    {"medicine_id": 308, "name": "Insulin",      "category": "Antidiabetic",  "price": 450, "stock": 30,  "manufacturer": "SunLife Pharma"},
]

result = medicines.insert_many(data)
print(f"Inserted {len(result.inserted_ids)} documents.\n")

print("Verification - documents in HospitalDB.medicines:")
for doc in medicines.find({}, {"_id": 0}):
    print(doc)
print("\nTotal documents:", medicines.count_documents({}))
