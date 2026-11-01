// Q2 - Same task using MongoDB Shell (mongosh). Copy-paste into mongosh.

use CollegeDB

db.students.insertMany([
  { student_id: "S101", name: "Aarav Sharma", age: 21, gender: "Male",   department: "MCA",   marks: 85 },
  { student_id: "S102", name: "Priya Singh",  age: 20, gender: "Female", department: "MCA",   marks: 72 },
  { student_id: "S103", name: "Rohit Verma",  age: 22, gender: "Male",   department: "BCA",   marks: 64 },
  { student_id: "S104", name: "Neha Gupta",   age: 19, gender: "Female", department: "BTech", marks: 91 },
  { student_id: "S105", name: "Karan Mehta",  age: 23, gender: "Male",   department: "BCA",   marks: 48 },
  { student_id: "S106", name: "Anjali Rawat", age: 21, gender: "Female", department: "MBA",   marks: 78 }
])

// Verify
show dbs
show collections
db.students.find().pretty()
db.students.countDocuments()
