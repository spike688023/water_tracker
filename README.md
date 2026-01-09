# 💧 Water Tracker (AI-Powered)

[中文版 (Chinese)](README.md) | [English (英文版)](README_EN.md)

這是一個使用 **Google Antigravity** 輔助開發的現代化 Flutter App。
它結合了極致的 **Glassmorphism (毛玻璃)** UI 設計與 **On-Device AI (裝置端人工智慧)** 概念，用來展示未來 App 的開發趨勢。

## ✨ 核心特色 (Key Features)

1.  **🎨 Glassmorphic UI (毛玻璃介面)**
    *   全域使用磨砂玻璃質感，搭配柔和的漸層背景。
    *   效能優化：使用 `RepaintBoundary` 包裹模糊層，確保滑動順暢。
    *   動效：進度環使用 `TweenAnimationBuilder` 呈現彈性填充效果。

2.  **🧠 On-Device AI Coach (裝置端 AI 教練)**
    *   **Gemma 3n Simulation**：模擬了在手機端執行 LLM 的情境。
    *   **智慧提醒**：AI 會根據你的喝水進度 (Context) 產生個人化的鼓勵通知，而不只是死板的定時響鈴。
    *   **隱私保護**：所有運算都在本機進行（目前為模擬模式），數據不傳上雲端。

3.  **💾 Smart Persistence (智慧儲存)**
    *   使用 `shared_preferences` 自動儲存喝水紀錄。
    *   **每日重置**：App 啟動時會自動檢查日期，若跨日則自動歸零，無需手動重置。

4.  **🎉 Delightful Moments (微互動)**
    *   當喝水達標 (100%) 時，會觸發 **Confetti (碎紙花)** 慶祝特效。

## 🛠️ 技術堆疊 (Tech Stack)

*   **Framework**: Flutter (Dart)
*   **State Management**: Provider
*   **Local Storage**: Shared Preferences
*   **Notifications**: Flutter Local Notifications
*   **AI Simulation**: Custom GemmaService (Mock logical unit)
*   **Animation**: Flutter Animate, Confetti

## 🚀 如何執行 (How to Run)

### 1. 啟動模擬器 (Start Emulator)
確保你已經安裝 Flutter SDK 並設定好 Android 模擬器。在執行 App 前，**務必先啟動模擬器**：

*   **方法 A (推薦 - 終端機)**：
    1.  列出所有模擬器：`flutter emulators`
    2.  啟動模擬器：`flutter emulators --launch <你的模擬器ID>`
        *(例如：`flutter emulators --launch sdk_gphone64_arm64`)*

*   **方法 B (GUI)**：
    開啟 Android Studio -> 點擊上方工具列的 **More Actions** (三個點) -> **Virtual Device Manager** -> 點擊綠色播放鍵 ▶️。

### 2. 安裝套件
在終端機進入專案目錄並執行：
```bash
flutter pub get
```

### 3. 啟動 App
確保模擬器已開啟，然後執行：
```bash
flutter run
```

## 🎮 操作指南 (User Guide)

1.  **喝水**：點擊主畫面下方的 **"+"** 懸浮按鈕。
2.  **設定目標**：點擊右上角的 **"齒輪"** 圖示。
    *   修改每日目標 (預設 2000ml)。
    *   **體驗 AI**：在設定頁中找到 "AI Hydration Coach"，點擊 **"Simulate Reminder Now"** 按鈕，模擬器稍微延遲後會跳出 AI 生成的通知。
3.  **慶祝**：喝水喝到滿 (100%)，享受慶祝煙火！

## 📂 專案結構
*   `lib/ui/widgets/common/glass_container.dart`: 毛玻璃核心元件 (含效能優化)。
*   `lib/core/services/gemma_service.dart`: 模擬 AI 生成邏輯的地方。
*   `lib/providers/water_provider.dart`: 處理資料狀態與每日重置邏輯。

---
*Created with the assistance of Google Antigravity.*
