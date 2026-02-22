# 📅 Age Calculator Pro

A sleek, modern, and fully responsive **Age Calculator** built with Flutter and Material 3. This app calculates your exact age down to the minute, tracks life progress, and identifies your zodiac signs with a beautiful, animated UI.

## ✨ Features

### 🛠 Core Functionality

* **Exact Age Calculation:** Get your age in years, months, and days.
* **Detailed Breakdown:** View total weeks, days, hours, and minutes lived.
* **Next Birthday:** A countdown timer showing how many days remain until your next celebration.
* **Zodiac Insights:** Automatically identifies both **Western** and **Chinese** zodiac signs.
* **Birth Day:** Displays the day of the week you were born (e.g., "Born on a Tuesday").

### 🎨 Design & UX

* **Material 3:** Modern design system with dynamic color support.
* **Adaptive Layout:** Fully responsive for **Mobile**, **Tablet**, and **Web**.
* **Theme Persistence:** Toggle between Light and Dark modes; your preference is saved locally.
* **Smooth Animations:** Utilizes implicit animations for a premium feel.

### 🚀 Extra Features

* **Life Progress Bar:** A visual representation of your journey toward 100 years.
* **Fun Facts:** Estimated total heartbeats and breaths taken.
* **Share & Copy:** Easily share your results with friends or copy them to your clipboard.
* **Error Handling:** Prevents future date selection with user-friendly snacks bars.

---

## 🏗 Project Structure

The project follows a **Clean Architecture** pattern to ensure scalability and readability:

```text
lib/
├── providers/      # State management (Theme & Logic handling)
├── screens/        # UI Layers (Splash, Home, Result)
├── utils/          # Logic engines (Calculators, Zodiac helpers)
├── widgets/        # Reusable components (CustomCards, Buttons)
└── main.dart       # App entry point & Theme configuration

```

---

## 🚀 Getting Started

### Prerequisites

* Flutter SDK: `^3.19.0` (or latest)
* Dart SDK: `^3.3.0`
* A code editor (VS Code or Android Studio)

### Installation

1. **Clone the repository:**
```bash
git clone https://github.com/aiwithmaaz/age-calculator-pro.git

```


2. **Navigate to the project folder:**
```bash
cd age-calculator-pro

```


3. **Install dependencies:**
```bash
flutter pub get

```


4. **Run the app:**
```bash
flutter run

```



---

## 📦 Dependencies Used

| Package | Purpose |
| --- | --- |
| `provider` | State management for themes and data. |
| `shared_preferences` | Local storage for theme persistence. |
| `intl` | Date formatting and localization. |
| `share_plus` | Native sharing capabilities. |

---

## 📱 Screenshots
<img width="1600" height="900" alt="image" src="https://github.com/user-attachments/assets/e85cb797-5644-4202-8c29-f321cb34ce7f" />

<img width="1600" height="798" alt="image" src="https://github.com/user-attachments/assets/00f2e42a-c140-4561-8aab-867b22a1634f" />

<img width="1600" height="900" alt="image" src="https://github.com/user-attachments/assets/0061e85b-2f37-4f81-85e5-78b65d7ac434" />


---

## 🤝 Contributing

Contributions are welcome! If you have ideas for new "Fun Stats" or UI improvements, feel free to fork the repo and submit a pull request.

---
