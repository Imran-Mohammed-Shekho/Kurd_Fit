# 🏋️ KurdFitness

**KurdFitness** is a modern fitness management application built to help users, trainers, and gym owners manage workouts, diet plans, subscriptions, and fitness progress in one powerful and easy-to-use platform.

Designed with performance, security, and scalability in mind.

---

## 📸 App Screenshots

### 🔐 Authentication
![Login Screen](images/login.png)

### 🏠 Home Dashboard
![Home Screen](images/home.png)

### 🏃 Workouts
![Workouts Screen](images/workouts.png)

### 🥗 Diet Plans
![Diet Plans Screen](images/diet.png)

### 💳 Subscriptions
![Subscription Screen](images/subscription.png)

---

## 🚀 Features

### 👤 User Management
- Secure authentication
- User profile management
- Fitness goal tracking
- Progress history

### 🏃 Workout Management
- Predefined workout plans
- Custom workout creation
- Daily & weekly schedules
- Exercise progress tracking

### 🧑‍🏫 Trainers
- Trainer profiles
- Assign workouts to users
- Monitor and evaluate user performance

### 🥗 Diet Plans
- Personalized meal plans
- Nutrition guidance
- Daily diet tracking

### 💳 Subscriptions
- Membership plans
- Subscription status
- Expiry & renewal tracking

### 📊 Analytics & Progress
- Workout completion stats
- Fitness progress insights
- Performance visualization

---

## 🛠 Tech Stack

### Frontend
- **Flutter**
- Clean Architecture
- Responsive UI
- UI/UX designed with **Figma**

### Backend
- **Firebase**
  - Authentication
  - Cloud Firestore
  - Firebase Storage
- **Python**
  - Backend logic
  - Automation scripts

---

## 🧱 Project Architecture

The project follows **Clean Architecture** principles for scalability and maintainability.

lib/
│── core/
│── data/
│ ├── models/
│ ├── repositories/
│── domain/
│ ├── entities/
│ ├── usecases/
│── presentation/
│ ├── screens/
│ ├── widgets/
│── main.dart

yaml
Copy code

---

## 🔐 Security Considerations

- Firebase Authentication protects all user access
- Firestore rules restrict data per authenticated user
- Sensitive data is never stored locally

⚠️ **Security Warning**  
Improper Firestore rules can allow attackers to read or modify other users’ data. Always enforce:
```js
request.auth != null && request.auth.uid == resource.data.userId
⚙️ Installation & Setup
1️⃣ Clone Repository
bash
Copy code
git clone https://github.com/yourusername/kurdFitness.git
cd kurdFitness
2️⃣ Install Dependencies
bash
Copy code
flutter pub get
3️⃣ Firebase Configuration
Create a Firebase project

Enable Authentication & Firestore

Add Android & iOS apps

Download configuration files

4️⃣ Run Application
bash
Copy code
flutter run
🎨 Design
Clean & modern fitness-focused UI

Designed with Figma

Optimized for both Android & iOS

📌 Future Enhancements
Payment gateway integration

Push notifications

AI-based workout recommendations

Multi-language support (Kurdish & English)

Admin dashboard

📄 License
This project is developed for educational and portfolio purposes.

👨‍💻 Author
Engineer Imran
Mobile Application Developer
Flutter • Firebase • Python
