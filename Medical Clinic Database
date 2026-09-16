CREATE DATABASE medical_clinic;

USE medical_clinic;

CREATE TABLE patients (patient_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
                       full_name VARCHAR(100) NOT NULL,
                       birth_date DATE NOT NULL,
                       phone_number VARCHAR(20) NOT NULL
                      );

CREATE TABLE doctors(doctor_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
                     name VARCHAR(100) NOT NULL,
                     specialization VARCHAR(100) NOT NULL
                    );

CREATE TABLE appointments (appointment_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
                           doctor_id INT UNSIGNED NOT NULL,
                           patient_id INT UNSIGNED NOT NULL,
                           appointment_date DATE NOT NULL,
                           appointment_time TIME NOT NULL,
                           reason_for_visit TEXT NOT NULL,

                           FOREIGN KEY (doctor_id)
                               REFERENCES doctors(doctor_id),

                          FOREIGN KEY (patient_id)
                              REFERENCES patients(patient_id)
                          );


CREATE TABLE prescriptions (prescription_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
                           appointment_id INT UNSIGNED NOT NULL,
                           instruction TEXT,
                           dosage TEXT,
                           FOREIGN KEY(appointment_id)
                               REFERENCES appointments(appointment_id)
                          );
