# Lab Sheet 9 - MongoDB + Python Flask + HTML/CSS (Student Record Management System)

Open the `LabSheet9` folder in VS Code. One folder per question.

| Folder | Question | How to run |
|---|---|---|
| Q1_Setup | Environment check | `python Q1_Setup/Q1_verify_setup.py` |
| Q2_Create_DB_Insert | CollegeDB + 6 student docs | `python Q2_Create_DB_Insert/Q2_insert_students.py` (or paste the .js into mongosh) |
| Q3_Q4_HTML_CSS | Registration form + CSS | Open `index.html` in browser (Live Server) |
| Q5_Flask_Connect | Flask <-> MongoDB connection | `python Q5_Flask_Connect/Q5_app.py` |
| Q6_Add_Student | Add student | `cd Q6_Add_Student` then `python app.py` |
| Q7_View_Students | View table | `cd Q7_View_Students` then `python app.py` |
| Q8_Search_Student | Search by ID | `cd Q8_Search_Student` then `python app.py` |
| Q9_Update_Student | Update | `cd Q9_Update_Student` then `python app.py` |
| Q10_Delete_Student | Delete | `cd Q10_Delete_Student` then `python app.py` |
| Q11_Filtering | 4 filter queries | `cd Q11_Filtering` then `python app.py` |
| Q12_Complete_App | Full application | `cd Q12_Complete_App` then `python app.py` |

## Setup
```
python -m venv venv
venv\Scripts\activate        # Windows  (Mac/Linux: source venv/bin/activate)
pip install -r requirements.txt
```
Make sure MongoDB is running on localhost:27017, run Q2 once to create the sample data,
then run any app and open http://127.0.0.1:5000/
