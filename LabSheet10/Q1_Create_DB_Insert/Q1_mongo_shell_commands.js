// Q1 - Same task using MongoDB Shell (mongosh). Copy-paste into mongosh.

use HospitalDB

db.medicines.insertMany([
  { medicine_id: 301, name: "Paracetamol",  category: "Analgesic",     price: 25,  stock: 100, manufacturer: "ABC Pharma" },
  { medicine_id: 302, name: "Amoxicillin",  category: "Antibiotic",    price: 120, stock: 45,  manufacturer: "MediCare Ltd" },
  { medicine_id: 303, name: "Ibuprofen",    category: "Analgesic",     price: 40,  stock: 20,  manufacturer: "HealWell Labs" },
  { medicine_id: 304, name: "Cetirizine",   category: "Antihistamine", price: 18,  stock: 150, manufacturer: "ABC Pharma" },
  { medicine_id: 305, name: "Azithromycin", category: "Antibiotic",    price: 95,  stock: 25,  manufacturer: "MediCare Ltd" },
  { medicine_id: 306, name: "Omeprazole",   category: "Antacid",       price: 60,  stock: 80,  manufacturer: "HealWell Labs" },
  { medicine_id: 307, name: "Metformin",    category: "Antidiabetic",  price: 55,  stock: 12,  manufacturer: "SunLife Pharma" },
  { medicine_id: 308, name: "Insulin",      category: "Antidiabetic",  price: 450, stock: 30,  manufacturer: "SunLife Pharma" }
])

// Verify
show dbs
show collections
db.medicines.find().pretty()
db.medicines.countDocuments()
