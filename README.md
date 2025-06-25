# hospital-management-system

This is a basic Hospital Management System project built using HTML, CSS, JavaScript, Bootstrap.

## ✅ Features

- 🧾 Patient registration & management
- 🗓️ Appointment scheduling (doctors/patients)
- 👨‍⚕️ Doctor profile & specialization module
- 💊 Medicine & inventory tracking
- 💰 Billing & invoice generation
- 🧑‍⚕️ Admin dashboard & analytics
- 🔒 Secure login/authentication (if included)
- 🗃️ Record export (PDF/CSV) [optional]

---

## 💻 Tech Stack

| Layer       | Tech Used                  |
|-------------|----------------------------|
| Frontend    | HTML, CSS, JavaScript, Bootstrap, JSTL |
| Backend     | JSP, Servlets              |
| Database    | MySQL                      |
| Server      | Apache Tomcat 9+           |
| Build Tool  | Maven (or manual WAR packaging) |

---


## ⚙️ Installation

```bash
# 1. Clone the repository
git clone https://github.com/YOUR_USERNAME/hospital-management-system.git

# 2. Navigate into the project directory
cd hospital-management-system

# 3. Setup the database
# - Open your SQL tool (phpMyAdmin / MySQL Workbench)
# - Import `hospital_db.sql` from the project

# 4. Configure the environment
# - If using PHP, update `db_config.php`
# - If using .env, create it and add DB credentials

# 5. Run the project
# - For PHP: place it in XAMPP's htdocs folder and run via localhost
# - For Node/Python: run `npm start` or `python app.py`
```

----

## 🚀 Usage
Access the system from http://localhost/hospital-management-system

Login as admin or create new user

Use the navigation bar to manage patients, doctors, medicines, etc.

---


## 📁 Folder Structure
hospital-management-system/
│
├── assets/             # CSS, JS, images
├── database/           # SQL dump or migration files
├── includes/           # Common scripts or modules
├── pages/              # Core application pages
├── README.md
├── .gitignore
└── index.html / index.php
