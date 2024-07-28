---

# E-commerce App

This is a Flutter-based e-commerce application that allows users to browse and purchase products. The app includes user authentication using Firebase and integrates Firebase Remote Config to control various app settings dynamically.

## Features

- User Authentication (Sign up, Sign in, Sign out)
- Browse products
- Display discounted prices
- Firebase Remote Config integration

## Technologies Used

- Flutter
- Firebase Authentication
- Firebase Firestore
- Firebase Remote Config
- Provider for state management

## Getting Started

### Prerequisites

Before you begin, ensure you have met the following requirements:

- You have installed Flutter on your development machine.
- You have set up a Firebase project.

### Installation

1. Clone this repository:

```bash
git clone https://github.com/your-username/ecommerce_app.git
cd ecommerce_app
```

2. Install dependencies:

```bash
flutter pub get
```

3. Set up Firebase:

- Follow the instructions to add Firebase to your Flutter app [here](https://firebase.flutter.dev/docs/overview).

- Make sure to add the `google-services.json` file to the `android/app` directory and the `GoogleService-Info.plist` file to the `ios/Runner` directory.

4. Configure Firebase Firestore:

- Enable Firestore in your Firebase project.
- Set Firestore rules (in Firestore -> Rules):

```plaintext
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    match /{document=**} {
      allow read, write: if request.auth != null;
    }
  }
}
```

5. Configure Firebase Remote Config:

- Enable Remote Config in your Firebase project.
- Create a parameter `displayDiscountedPrice` and set its default value to `true` or `false`.

### Running the App

1. Connect your device or start an emulator.
2. Run the app:

```bash
flutter run
```

## Usage

### Authentication

The app supports email and password authentication. Users can sign up, log in, and log out.

### Product Listing

Products are fetched from an API and displayed in a grid view. Discounted prices are shown if configured through Firebase Remote Config.

### Remote Config

The app uses Firebase Remote Config to toggle the display of discounted prices. This setting can be updated in the Firebase console and will reflect in the app without requiring an update.



---
