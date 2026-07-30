# Ihute Ride Frontend 🚴🏍️

## Rider Empowerment Platform - Flutter Application

This repository contains the frontend application for **Ihute Ride**, a rider empowerment platform developed to support motorcycle riders in Rwanda.

The application provides an interactive user interface where riders can register, log in, manage their profiles, and access rider-focused services such as savings, insurance, and motorcycle support.

---

# Frontend Features

Implemented features:

✅ User registration
✅ User login
✅ Home dashboard
✅ Rider profile management
✅ Update profile information
✅ Savings service page
✅ Insurance service page
✅ Motorcycle support page
✅ Navigation between screens
✅ Backend API integration

---

# Technology Stack

* Flutter
* Dart
* Material UI
* HTTP package for API communication

---

# Project Structure

```text
frontend/

├── lib/
│
│── main.dart
│
├── screens/
│   ├── sign_in_screen.dart
│   ├── register_screen.dart
│   ├── home_screen.dart
│   ├── profile_screen.dart
│   ├── savings_screen.dart
│   ├── insurance_screen.dart
│   ├── bike_screen.dart
│   └── main_navigation.dart
│
├── services/
│   └── api_service.dart
│
├── assets/
│   └── ihute_logo.png
│
├── pubspec.yaml
└── README.md
```

---

# Requirements

Before running the application, install:

* Flutter SDK
* Dart SDK
* Google Chrome
* Visual Studio Code or Android Studio

Check Flutter installation:

```bash
flutter doctor
```

---

# Installation Guide

## 1. Clone Repository

```bash
git clone YOUR_FRONTEND_REPOSITORY_LINK
```

Navigate into the project:

```bash
cd frontend
```

---

## 2. Install Dependencies

Run:

```bash
flutter pub get
```

This installs all required Flutter packages.

---

# Backend Connection Setup

The application communicates with the Ihute Ride backend API.

Before running the application:

1. Make sure the backend server is running.
2. Update the API URL in the Flutter files.

Example:

```dart
static const String baseUrl = 
"http://YOUR_COMPUTER_IP:5000";
```

Replace:

```
YOUR_COMPUTER_IP
```

with the IP address of the computer running the backend.

Example:

```dart
static const String baseUrl =
"http://192.168.1.72:5000";
```

---

# Running the Application

## Run on Chrome (Web)

Use:

```bash
flutter run -d chrome
```

The application will open in Google Chrome.

---

# Application Flow

## 1. Registration

New users can create an account by providing:

* Name
* Email
* Password

The information is sent to the backend API and stored in the database.

---

## 2. Login

Existing users can log in using:

* Email
* Password

After successful authentication, users are redirected to the main dashboard.

---

## 3. Home Dashboard

The home screen provides access to the main rider services:

* Savings
* Insurance
* Motorcycle services
* Profile

---

## 4. Profile Management

Users can:

* View profile information
* Update name
* Update phone number
* Update occupation

Changes are saved through the backend API.

---

# Screens Included

### Sign In Screen

Allows existing users to securely access their accounts.

### Register Screen

Allows new riders to create accounts.

### Home Screen

Main dashboard for accessing services.

### Savings Screen

Provides access to rider saving services.

### Insurance Screen

Provides access to insurance-related services.

### Bike Screen

Provides motorcycle-related support.

### Profile Screen

Allows users to manage personal information.

---

# Testing

The frontend was tested by verifying:

✅ User registration flow
✅ Login flow
✅ Navigation between pages
✅ Profile update functionality
✅ Communication with backend API

---

# Future Improvements

Future frontend improvements include:

* Improved UI animations
* Offline USSD support
* Push notifications
* Digital payment integration
* Additional rider services

---

# Author

**Lea Mugabo**

Software Engineering Student

African Leadership University

---

# License

This project was developed for academic purposes as part of a Software Engineering project.
