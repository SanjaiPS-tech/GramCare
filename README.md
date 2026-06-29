# GramCare - AI-Powered Rural Elderly Healthcare Companion

GramCare is a comprehensive healthcare platform designed to support elderly users in rural areas. It features AI-powered prescription explanations, medication reminders, voice-assisted navigation, and emergency SOS systems.

## Project Structure

- `gramcare_app/`: Flutter mobile application (Offline-first, Multilingual).
- `gramcare_backend/`: Spring Boot 3.x REST API (Java 21, PostgreSQL).

## Features

- **Medicine Reminders**: Local and voice-call reminders for medication adherence.
- **AI Prescription Explainer**: Scans prescriptions using OCR and explains them using Gemini AI.
- **Voice Assistant**: Navigate and get help using voice commands in multiple languages.
- **Emergency SOS**: One-touch SOS to alert family and health workers with GPS location.
- **Family Dashboard**: Dedicated portal for family members to monitor elderly health.
- **Telemedicine**: Easy doctor consultations and appointment booking.
- **Health Records**: Securely store and export medical history as PDFs.
- **Offline Sync**: Reliable operation in areas with poor internet connectivity.

## How to Run

### Backend (Spring Boot)

1.  Navigate to `gramcare_backend/`.
2.  Ensure you have Docker installed.
3.  Run `docker-compose up --build`.
4.  The API will be available at `http://localhost:8080`.
5.  Swagger documentation: `http://localhost:8080/swagger-ui/index.html`.

### Frontend (Flutter)

1.  Navigate to `gramcare_app/`.
2.  Ensure you have Flutter 3.x installed.
3.  Run `flutter pub get`.
4.  Run `dart run build_runner build --delete-conflicting-outputs`.
5.  Run `flutter run`.

## Environment Variables

### Backend
- `DB_HOST`: Database host.
- `JWT_SECRET`: Secret key for JWT tokens.
- `GEMINI_API_KEY`: Google Gemini AI API key.

### Frontend
- `API_BASE_URL`: Base URL for the backend API.
- `GEMINI_API_KEY`: API key for local AI features.

## Tech Stack

- **Mobile**: Flutter, Riverpod, Drift (SQLite3), GoRouter, Dio, ML Kit.
- **Backend**: Spring Boot, Spring Security (JWT), Hibernate, Flyway, PostgreSQL.
- **AI**: Google Gemini Pro, ML Kit OCR.
