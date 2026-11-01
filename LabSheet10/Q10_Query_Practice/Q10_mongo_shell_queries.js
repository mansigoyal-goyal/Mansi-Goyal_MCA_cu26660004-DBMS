// Q10 - Same queries in MongoDB Shell (mongosh)
use HospitalDB

db.medicines.find({ category: "Antibiotic" })          // (a) particular category
db.medicines.find({ price: { $gt: 50 } })               // (b) price > 50
db.medicines.find({ price: { $lt: 100 } })              // (c) price < 100
db.medicines.find({ stock: { $lt: 30 } })               // (d) stock < 30
db.medicines.find({ manufacturer: "ABC Pharma" })       // (e) particular manufacturer
db.medicines.find().sort({ price: 1 })                  // (f) sort by price (ascending)
db.medicines.find().sort({ price: -1 })                 //     sort by price (descending)
db.medicines.find().sort({ stock: 1 })                  // (g) sort by stock (ascending)
db.medicines.find().sort({ stock: -1 })                 //     sort by stock (descending)
