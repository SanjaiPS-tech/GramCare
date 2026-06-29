-- V1__Initial_Schema.sql

CREATE TABLE roles (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL,
    description VARCHAR(255)
);

INSERT INTO roles (name, description) VALUES 
('ELDERLY_USER', 'Primary elderly user'),
('FAMILY_MEMBER', 'Family member or caregiver'),
('DOCTOR', 'Medical professional'),
('COMMUNITY_HEALTH_WORKER', 'Rural health worker'),
('ADMINISTRATOR', 'System administrator');

CREATE TABLE users (
    id UUID PRIMARY KEY,
    phone VARCHAR(20) UNIQUE NOT NULL,
    email VARCHAR(255),
    password_hash VARCHAR(255) NOT NULL,
    full_name VARCHAR(255) NOT NULL,
    date_of_birth DATE,
    gender VARCHAR(20),
    blood_group VARCHAR(10),
    address TEXT,
    village VARCHAR(100),
    district VARCHAR(100),
    state VARCHAR(100),
    language_preference VARCHAR(10) DEFAULT 'en',
    profile_image_url VARCHAR(255),
    is_active BOOLEAN DEFAULT TRUE,
    role_id INTEGER NOT NULL REFERENCES roles(id),
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL
);

CREATE TABLE medicines (
    id UUID PRIMARY KEY,
    user_id UUID NOT NULL REFERENCES users(id),
    name VARCHAR(255) NOT NULL,
    dosage VARCHAR(100) NOT NULL,
    frequency VARCHAR(100) NOT NULL,
    timing VARCHAR(100) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE,
    instructions TEXT,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL
);

CREATE TABLE medicine_logs (
    id UUID PRIMARY KEY,
    medicine_id UUID NOT NULL REFERENCES medicines(id),
    user_id UUID NOT NULL REFERENCES users(id),
    log_date DATE NOT NULL,
    scheduled_time VARCHAR(50) NOT NULL,
    status VARCHAR(20) NOT NULL,
    taken_at TIMESTAMP,
    notes TEXT,
    created_at TIMESTAMP NOT NULL
);

CREATE TABLE prescriptions (
    id UUID PRIMARY KEY,
    user_id UUID NOT NULL REFERENCES users(id),
    image_url VARCHAR(255),
    ocr_text TEXT,
    ai_explanation TEXT,
    language VARCHAR(10),
    doctor_id UUID,
    prescribed_date DATE,
    created_at TIMESTAMP NOT NULL
);

CREATE TABLE health_records (
    id UUID PRIMARY KEY,
    user_id UUID NOT NULL REFERENCES users(id),
    record_type VARCHAR(50) NOT NULL,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    file_url VARCHAR(255),
    record_date DATE NOT NULL,
    created_at TIMESTAMP NOT NULL
);

CREATE TABLE emergency_contacts (
    id UUID PRIMARY KEY,
    user_id UUID NOT NULL REFERENCES users(id),
    name VARCHAR(255) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    relationship VARCHAR(100) NOT NULL,
    is_primary BOOLEAN DEFAULT FALSE
);

CREATE TABLE emergency_alerts (
    id UUID PRIMARY KEY,
    user_id UUID NOT NULL REFERENCES users(id),
    latitude DOUBLE PRECISION,
    longitude DOUBLE PRECISION,
    alert_type VARCHAR(50) NOT NULL,
    status VARCHAR(50) NOT NULL,
    triggered_at TIMESTAMP NOT NULL,
    resolved_at TIMESTAMP
);

CREATE TABLE appointments (
    id UUID PRIMARY KEY,
    patient_id UUID NOT NULL REFERENCES users(id),
    doctor_id UUID NOT NULL REFERENCES users(id),
    appointment_time TIMESTAMP NOT NULL,
    status VARCHAR(50) NOT NULL,
    meeting_link VARCHAR(255),
    consultation_notes TEXT,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL
);

CREATE TABLE family_monitoring (
    id UUID PRIMARY KEY,
    family_member_id UUID NOT NULL REFERENCES users(id),
    elderly_user_id UUID NOT NULL REFERENCES users(id),
    relationship VARCHAR(100),
    is_approved BOOLEAN DEFAULT FALSE,
    linked_at TIMESTAMP NOT NULL
);

CREATE TABLE risk_predictions (
    id UUID PRIMARY KEY,
    user_id UUID NOT NULL REFERENCES users(id),
    health_score INTEGER,
    risk_level VARCHAR(20),
    diabetes_risk TEXT,
    hypertension_risk TEXT,
    compliance_risk TEXT,
    hospitalization_risk TEXT,
    recommendations TEXT,
    predicted_at TIMESTAMP NOT NULL
);

CREATE TABLE health_worker_visits (
    id UUID PRIMARY KEY,
    worker_id UUID NOT NULL REFERENCES users(id),
    patient_id UUID NOT NULL REFERENCES users(id),
    visit_type VARCHAR(100),
    notes TEXT,
    observations TEXT,
    latitude DOUBLE PRECISION,
    longitude DOUBLE PRECISION,
    visited_at TIMESTAMP NOT NULL
);

CREATE TABLE surveys (
    id UUID PRIMARY KEY,
    worker_id UUID NOT NULL REFERENCES users(id),
    patient_id UUID NOT NULL REFERENCES users(id),
    survey_type VARCHAR(100),
    responses TEXT,
    completed_at TIMESTAMP NOT NULL
);

CREATE TABLE notifications (
    id UUID PRIMARY KEY,
    user_id UUID NOT NULL REFERENCES users(id),
    title VARCHAR(255),
    body TEXT,
    type VARCHAR(50),
    is_read BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP NOT NULL
);

CREATE TABLE audit_logs (
    id UUID PRIMARY KEY,
    user_id UUID REFERENCES users(id),
    action VARCHAR(255),
    entity_type VARCHAR(100),
    entity_id VARCHAR(100),
    old_value TEXT,
    new_value TEXT,
    ip_address VARCHAR(50),
    created_at TIMESTAMP NOT NULL
);

-- Indexes for performance
CREATE INDEX idx_users_phone ON users(phone);
CREATE INDEX idx_medicines_user ON medicines(user_id);
CREATE INDEX idx_medicine_logs_user_date ON medicine_logs(user_id, log_date);
CREATE INDEX idx_appointments_patient ON appointments(patient_id);
CREATE INDEX idx_appointments_doctor ON appointments(doctor_id);
CREATE INDEX idx_emergency_alerts_user ON emergency_alerts(user_id);
