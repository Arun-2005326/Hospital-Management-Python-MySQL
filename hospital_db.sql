CREATE TABLE patients (
    patient_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    age INT,
    gender VARCHAR(40),
    phone VARCHAR(16),
    address VARCHAR(100)
);

CREATE TABLE doctors (
    doctor_id INT PRIMARY KEY AUTO_INCREMENT,
    NAME VARCHAR(100),
    SPECIALIZATION VARCHAR(120),
    PHONE VARCHAR(16)
);

CREATE TABLE appointments (
    appointment_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    doctor_id INT,
    date DATE,
    time TIME,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id)
);

CREATE TABLE treatments (
    treatment_id INT PRIMARY KEY AUTO_INCREMENT,
    appointment_id INT,
    diagnosis VARCHAR(20),
    medicine VARCHAR(20),
    FOREIGN KEY (appointment_id) REFERENCES appointments(appointment_id)
);

CREATE TABLE billing (
    bill_id INT PRIMARY KEY AUTO_INCREMENT,
    treatment_id INT,
    amount DECIMAL(10,2),
    status VARCHAR(20),
    FOREIGN KEY (treatment_id) REFERENCES treatments(treatment_id)
);

INSERT INTO patients (name, age, gender, phone, address) VALUES
('Arun', 22, 'male', '9865030', 'coimbatore'),
('priya', 34, 'female', '7890654', 'chennai'),
('karan', 37, 'male', '890765', 'bangalore'),
('meena', 40, 'female', '7654378', 'hyderabad');

INSERT INTO doctors (name, specialization, phone) VALUES
('dr.kumar', 'cardiologist', '90000875555'),
('dr.viji', 'dermatologist', '5678935555'),
('dr.gopikarun', 'neurologist', '908778906');

INSERT INTO appointments (patient_id, doctor_id, date, time) VALUES
(1, 1, '2025-11-16', '10:00:00'),
(2, 2, '2025-11-16', '11:30:00'),
(3, 3, '2025-11-17', '09:45:00'),
(4, 1, '2025-11-17', '12:00:00');

INSERT INTO treatments (appointment_id, diagnosis, medicine) VALUES
(1, 'chest pain', 'aspirin'),
(2, 'skin allergy', 'cetirizine'),
(3, 'migraine', 'paracetamol'),
(4, 'high bp', 'amlodipine');

INSERT INTO billing (treatment_id, amount, status) VALUES
(1, 1500, 'paid'),
(2, 800, 'pending'),
(3, 1200, 'paid'),
(4, 2000, 'pending');

SELECT * FROM patients;
SELECT * FROM doctors;

SELECT a.appointment_id, p.name AS patient, d.name AS doctor, a.date, a.time
FROM appointments a
JOIN patients p ON a.patient_id = p.patient_id
JOIN doctors d ON a.doctor_id = d.doctor_id;

SELECT b.bill_id, p.name, t.diagnosis, b.amount, b.status
FROM billing b
JOIN treatments t ON b.treatment_id = t.treatment_id
JOIN appointments a ON t.appointment_id = a.appointment_id
JOIN patients p ON a.patient_id = p.patient_id;

SELECT d.name, COUNT(a.appointment_id) AS total_appointments
FROM doctors d
LEFT JOIN appointments a ON d.doctor_id = a.doctor_id
GROUP BY d.name;
