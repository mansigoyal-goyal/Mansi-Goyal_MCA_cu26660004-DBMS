# Database Technologies – Lab Sheet 3 (Q01–Q30)

This folder contains one MySQL `.sql` file for each question in the supplied PDF.

## Open in VS Code
1. Extract the ZIP file.
2. Open the `LABSHEET 9` folder in VS Code.
3. Open each `Question N.sql` file to view/run that answer.
4. Run the statements in MySQL Workbench or a configured MySQL terminal/extension.

## Important notes
- These answers follow the questions and account/table names in the supplied lab sheet.
- Run the database/table setup from pages 1–2 of the PDF before running the question files.
- Some questions require a suitable administrator account to grant/revoke global privileges, create users/roles, or alter accounts.
- Q19, Q21, Q25 and Q29 use stored procedures to demonstrate conditional transaction logic.
- Q25 requires an administrator to grant `UPDATE` on `company_db.departments` to `manager`, because the lab's listed manager grants cover only `company_db.orders`.
- Q27 must be run using two separate MySQL sessions to demonstrate a deadlock.
- Change example passwords before using these scripts in a real environment.
