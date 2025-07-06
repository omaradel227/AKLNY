# 🍲 AKLNY - Smart Cooking Assistant

AKLNY is an AI-powered mobile application built to enhance the home cooking experience through personalized recipe recommendations, intelligent food analysis, and real-time chatbot assistance.

> Final Year Senior Project - Nile University  
> Supervised by Dr. Tamer Arafa  
> Fall 2024

---

## 🚀 Project Overview

AKLNY helps users:

- Discover new recipes tailored to their preferences  
- Reduce food waste by managing leftovers  
- Receive nutritional insights through image-based food analysis  
- Get real-time assistance via an integrated AI chatbot  

Whether you're a beginner or an experienced cook, AKLNY aims to make cooking simpler, healthier, and more fun.

---

## 🎯 Features

- **Personalized Recipe Recommendations**  
  Using machine learning and hybrid recommendation systems (content-based + collaborative filtering).

- **Leftover Management**  
  Upload images of food and receive suggestions to minimize waste.

- **Nutritional Analysis**  
  Computer vision + depth estimation (YOLO + MiDaS) to estimate food volume and calculate nutritional facts.

- **AI-Powered Chatbot**  
  Real-time cooking guidance and FAQs using OpenAI GPT.

- **User Profiles**  
  Preferences, allergies, and dietary goals stored and used to tailor experience.

- **Admin Panel**  
  Moderation of recipes, managing feedback, and user analytics.

---

## 🛠️ Tech Stack

### Frontend
- **Flutter** (Dart): Cross-platform mobile app

### Backend
- **Django** (Python): RESTful API with DRF  
- **WebSockets**: For real-time chatbot communication

### Machine Learning
- **YOLO (via Ultralytics)**: Object detection and food segmentation  
- **MiDaS**: Monocular depth estimation for volume calculation  
- **OpenAI GPT-4**: Conversational chatbot  
- **PyTorch + TorchVision + OpenCV**: ML & image processing

### Database
- **SQLite** (Dev) / **PostgreSQL** (Production-ready)

---

## 📸 Key Screens

- Recipe browsing & search  
- Leftover detection UI  
- Nutritional report interface  
- Real-time chatbot  
- Admin dashboard

---

## 🧠 How It Works

1. **User Signs In** → Selects preferences, allergies, goals  
2. **Recommender Engine** suggests recipes  
3. **User Uploads Image** → YOLO detects food → MiDaS estimates depth → Volum
4.
5. e calculated → Nutrition estimated  
6. **Chatbot Interaction** available for guidance, tips, and Q&A  

---

## 📦 Installation

### Backend

```bash
cd backend
pip install -r requirements.txt
python manage.py migrate
python manage.py runserver
```
### Frontend

```bash
cd frontend
flutter pub get
flutter run
```

## 🔐 Security Highlights

- **JWT authentication**
- **CSRF & XSS protection**
- **Email verification & password reset**
- **Encrypted user data**

---

## 🧪 Future Enhancements

- Offline recipe access
- Social recipe sharing & challenges
- Augmented Reality (AR) cooking assistant
- Voice-controlled cooking mode
- Deeper integration with fitness & health APIs

---



## 📄 License

This project is for educational use and not yet licensed for commercial deployment.

---

## 🏁 Acknowledgements

Special thanks to **Dr. Tamer Arafa** for his guidance and support throughout this project.
