# 💧 Water Tracker (AI-Powered)

[中文版 (Chinese)](README.md) | [English (英文版)](README_EN.md)

This is a modern Flutter App developed with the assistance of **Google Antigravity**.
It combines extreme **Glassmorphism** UI design with **On-Device AI** concepts to showcase the future trends of App development.

## ✨ Key Features

1.  **🎨 Glassmorphic UI**
    *   Frosted glass texture used globally, paired with soft gradient backgrounds.
    *   Performance Optimization: Uses `RepaintBoundary` to wrap blurred layers, ensuring smooth scrolling.
    *   Animation: Progress ring uses `TweenAnimationBuilder` to present an elastic filling effect.

2.  **🧠 On-Device AI Coach**
    *   **Gemma 3n Simulation**: Simulates the scenario of running an LLM on the mobile device.
    *   **Smart Reminders**: Uses AI to generate personalized encouraging notifications based on your hydration progress (Context), rather than just rigid timed alarms.
    *   **Privacy Protection**: All calculations are performed locally (currently in simulation mode), and data is not sent to the cloud.

3.  **💾 Smart Persistence**
    *   Uses `shared_preferences` to automatically save hydration records.
    *   **Daily Reset**: Checks the date automatically when the App starts; resets to zero if it's a new day, eliminating manual resets.

4.  **🎉 Delightful Moments**
    *   Triggers **Confetti** celebration effects when the hydration goal is reached (100%).

## 🛠️ Tech Stack

*   **Framework**: Flutter (Dart)
*   **State Management**: Provider
*   **Local Storage**: Shared Preferences
*   **Notifications**: Flutter Local Notifications
*   **AI Simulation**: Custom GemmaService (Mock logical unit)
*   **Animation**: Flutter Animate, Confetti

## 🚀 How to Run

### 1. Start Emulator
Ensure you have installed the Flutter SDK and set up an Android Emulator. **Make sure to start the emulator before running the App**:

*   **Method A (Recommended - Terminal)**:
    1.  List all emulators: `flutter emulators`
    2.  Launch emulator: `flutter emulators --launch <Your_Emulator_ID>`
        *(e.g., `flutter emulators --launch sdk_gphone64_arm64`)*

*   **Method B (GUI)**:
    Open Android Studio -> Click **More Actions** (three dots) on the top toolbar -> **Virtual Device Manager** -> Click the green play button ▶️.

### 2. Install Packages
Enter the project directory in the terminal and run:
```bash
flutter pub get
```

### 3. Launch App
Ensure the emulator is running, then execute:
```bash
flutter run
```

## 🎮 User Guide

1.  **Drink Water**: Click the **"+"** floating button at the bottom of the main screen.
2.  **Set Goal**: Click the **"Gear"** icon in the top right corner.
    *   Modify daily goal (default 2000ml).
    *   **Experience AI**: Find "AI Hydration Coach" in the settings page, click the **"Simulate Reminder Now"** button. After a slight delay, the simulator will pop up an AI-generated notification.
3.  **Celebrate**: Reach 100% hydration and enjoy the celebration fireworks!

## 📂 Project Structure
*   `lib/ui/widgets/common/glass_container.dart`: Core Glassmorphism component (includes performance optimization).
*   `lib/core/services/gemma_service.dart`: The place simulating AI generation logic.
*   `lib/providers/water_provider.dart`: Handles data state and daily reset logic.

---
*Created with the assistance of Google Antigravity.*
