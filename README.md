Period Tracker Web Application

A web-based menstrual cycle tracker built using Java, JSP, Servlets, JDBC, and MySQL. It allows users to track periods, predict fertile windows, view history, and manage their menstrual health with a user-friendly dashboard.

Features

User Registration & Login
Secure login with session management.

Dashboard
Personalized welcome, next period, fertile window, and period calendar.

Add Period Logs
Enter start date, duration, cycle length, and notes.

View History
List of previous period logs with all details.

Logout
Secure session termination.

Technology Stack
Technology	Purpose
Java	Backend programming
JSP	Frontend dynamic content
Servlets	Request handling and session management
JDBC	Database connectivity
MySQL	Data storage
HTML/CSS	UI and styling
Apache Tomcat	Web server
Database Design
Users Table
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(50) NOT NULL
);

Period Logs Table
CREATE TABLE period_logs (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    start_date DATE NOT NULL,
    duration INT NOT NULL,
    cycle_length INT NOT NULL,
    notes VARCHAR(200),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

Setup Instructions

Clone the repository

git clone https://github.com/your-username/period-tracker.git


Setup MySQL Database

Create a database period_tracker

Create tables users and period_logs (see above)

Update DbConnection.java with your DB credentials

Configure Tomcat

Add the project to Tomcat server in Eclipse/IDE

Run the server

Access the Application

http://localhost:8080/Period_tacker/login.jsp

Register a new user

Login and use the dashboard

Project Flow
Register → Login → Dashboard → Add Period → View History → Logout


Dashboard calculates Next Period and Fertile Window automatically.

Calendar view highlights Period Days, Fertile Days, and Today.


Future Enhancements

Email/SMS reminders for upcoming period

Password encryption for security

Analytics and charts for cycle trends

Responsive mobile design

License

MIT License © [kalyani wasane, nandini patil]
