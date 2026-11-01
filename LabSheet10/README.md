# Lab Sheet 10 - MongoDB + Python Flask + HTML/CSS (Hospital Medicine Management System)

Open the `LabSheet10` folder in VS Code. One folder per question.

| Folder | Question | How to run |
|---|---|---|
| Q1_Create_DB_Insert | HospitalDB + 8 medicine docs | `python Q1_Create_DB_Insert/Q1_insert_medicines.py` (or paste the .js into mongosh) |
| Q2_Q3_HTML_CSS | Medicine form + CSS | Open `index.html` in browser (Live Server) |
| Q4_Flask_Connect | Flask <-> MongoDB connection | `python Q4_Flask_Connect/Q4_app.py` |
| Q5_Add_Medicine | Add medicine | `cd Q5_Add_Medicine` then `python app.py` |
| Q6_View_Medicines | View table | `cd Q6_View_Medicines` then `python app.py` |
| Q7_Search_Medicine | Search by ID or Name | `cd Q7_Search_Medicine` then `python app.py` |
| Q8_Update_Stock | Update stock | `cd Q8_Update_Stock` then `python app.py` |
| Q9_Delete_Medicine | Delete + verify | `cd Q9_Delete_Medicine` then `python app.py` |
| Q10_Query_Practice | 7 queries (a)-(g) | `cd Q10_Query_Practice` then `python app.py` (also `Q10_mongo_shell_queries.js`) |
| Q11_Embedded_Documents | Embedded supplier doc | Run `python Q11_insert_with_supplier.py`, then `python app.py` in that folder |
| Q12_Inventory_Report | Inventory report | `cd Q12_Inventory_Report` then `python app.py` |
| Q13_Complete_App | Full application | `cd Q13_Complete_App` then `python app.py` |

## Setup
```
python -m venv venv
venv\Scripts\activate        # Windows  (Mac/Linux: source venv/bin/activate)
pip install -r requirements.txt
```
Make sure MongoDB is running on localhost:27017, run Q1 once to create the sample data
(and Q11 insert script for the supplier examples), then run any app and open http://127.0.0.1:5000/
