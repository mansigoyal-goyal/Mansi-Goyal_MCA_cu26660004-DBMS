"""
Q11 (Step 1) - Insert medicines that contain an EMBEDDED supplier document.
Run:  python Q11_insert_with_supplier.py      (run Q1 script first)
Document structure:
{
  "medicine_id": 401, "name": "...", "category": "...", "price": 30, "stock": 90, "manufacturer": "...",
  "supplier": { "name": "...", "phone": "...", "city": "..." }      <-- embedded document
}
"""
from pymongo import MongoClient

medicines = MongoClient("mongodb://localhost:27017/")["HospitalDB"]["medicines"]

# Remove old copies so the script can be re-run
medicines.delete_many({"medicine_id": {"$in": [401, 402, 403, 404]}})

data = [
    {"medicine_id": 401, "name": "Dolo 650",   "category": "Analgesic",  "price": 30,  "stock": 90, "manufacturer": "Micro Labs",
     "supplier": {"name": "Sharma Medical Agency", "phone": "9876543210", "city": "Delhi"}},
    {"medicine_id": 402, "name": "Augmentin",   "category": "Antibiotic", "price": 210, "stock": 40, "manufacturer": "GSK",
     "supplier": {"name": "Health First Distributors", "phone": "9123456780", "city": "Roorkee"}},
    {"medicine_id": 403, "name": "Pantoprazole","category": "Antacid",    "price": 75,  "stock": 15, "manufacturer": "Alkem",
     "supplier": {"name": "City Pharma Supply", "phone": "9988776655", "city": "Dehradun"}},
    {"medicine_id": 404, "name": "Vitamin C",   "category": "Supplement", "price": 45,  "stock": 200,"manufacturer": "Himalaya",
     "supplier": {"name": "Wellness Traders", "phone": "9090909090", "city": "Haridwar"}},
]
medicines.insert_many(data)
print("Inserted medicines with embedded supplier information:\n")

for doc in medicines.find({"supplier": {"$exists": True}}, {"_id": 0}):
    print(doc)

# Querying inside an embedded document (dot notation)
print("\nMedicines supplied from Roorkee:")
for doc in medicines.find({"supplier.city": "Roorkee"}, {"_id": 0, "name": 1, "supplier": 1}):
    print(doc)
