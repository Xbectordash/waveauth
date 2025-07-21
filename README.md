# WaveAuth - Flutter Animated Authentication UI

WaveAuth is a beautifully designed Flutter authentication module featuring a dynamic, animated wave background, custom gradient widgets, and a clean, modern user interface. It provides a seamless and engaging user experience for both sign-up and login flows.

[![WaveAuth Demo](https://img.youtube.com/vi/Kjg_NaZrKso/0.jpg)](https://youtube.com/shorts/Kjg_NaZrKso?si=H01lZpZniO0oTnJp)

## ✨ Features

- **Dynamic Wave Animation**: A stunning, multi-layered sine wave animation creates a fluid and visually appealing background.
- **State-Managed Auth Flow**: A single `AuthScreen` manages the UI state between the initial entry screen and the login screen, preventing nested navigation stacks.
- **Custom Gradient Widgets**: Includes custom-built, reusable widgets like `GradientButton` and `GradientCircularCheckbox` that match the app's aesthetic.
- **Floating Navigation**: A floating action button provides intuitive back navigation from the login view to the entry view.
- **Centralized Theming & Constants**: Project-wide colors, strings, and text styles are centralized in the `util` directory for easy maintenance and consistency.
- **Reusable Components**: Widgets like `LoginForm` and `SocialSignInWidget` are modular and can be easily customized.
- **Responsive Validation**: The login form includes standard validation for email and password fields.

## 📂 Project Structure

The project is organized into a clean and scalable structure:

```
lib/
├── main.dart             # App entry point
|
├── config/
│   └── app_themes.dart     # Material theme and styling
|
├── custom_painter/
│   ├── sprinkel.dart     # Custom painter for particle effects
│   └── wave.dart         # Custom painter for the sine wave animation
|
├── screen/
│   ├── auth_entry.dart   # Initial screen with Login/Create Account buttons
│   ├── auth_screen.dart    # Manages auth state (entry vs. login)
│   ├── login.dart        # Contains the login form and UI
│   └── wave_screen.dart    # Hosts the wave and sprinkle animations
|
├── util/
│   ├── const_colors.dart   # App color palette and gradients
│   ├── const_string.dart   # Centralized UI strings
│   └── const_text_style.dart # Reusable text styles
|
└── widget/
    ├── gradent_button.dart # Custom animated gradient button
    ├── gradient_checkbox.dart # Custom gradient checkbox
    ├── login_form.dart     # Email/password form with validation
    └── social_media.dart   # Social sign-in icons and text

```

## 🚀 Getting Started

### Prerequisites

- Flutter SDK: [Installation Guide](https://flutter.dev/docs/get-started/install)
- An editor like VS Code or Android Studio.

### Installation

1. Clone the repository:
   ```sh
   git clone https://github.com/your-username/waveauth.git
   ```
2. Navigate to the project directory:
   ```sh
   cd waveauth
   ```
3. Install dependencies:
   ```sh
   flutter pub get
   ```
4. Run the app:
   ```sh
   flutter run
   ```

## 🎨 Key Components

### Wave Animation

The background animation is created by stacking multiple `SineWavePainter` instances in `WaveScreen`. Each layer has a slightly different color, speed, and amplitude, creating a parallax effect. The animation is driven by an `AnimationController` that updates the UI continuously.

For a deep dive into the mathematics behind this animation, check out our Medium article: [Deconstructing a Dynamic Wave Animation in Flutter: A Mathematical Deep Dive](https://medium.com/@vectordash755/deconstructing-a-dynamic-wave-animation-in-flutter-a-mathematical-deep-dive-f80762e2ee96).

### Authentication Flow

The `AuthScreen` widget acts as a state machine. It holds an `AuthType` enum (`entry` or `login`) in its state. Instead of pushing new screens onto the navigation stack, UI components trigger callbacks that call `setState` on `AuthScreen`, which then rebuilds its body to show either the `AuthEntry` or `LoginScreen` widget. This creates a smooth, efficient, and predictable navigation flow.
