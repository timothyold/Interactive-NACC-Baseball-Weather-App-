# Baseball Weather App

## Introduction

The Baseball Weather App is designed for baseball enthusiasts and players in the NACC Division 3 baseball conference. Built using Dart and the Flutter SDK, this app provides real-time weather updates for various baseball fields in the conference. Stay informed about the wind direction, wind speed, and temperature at your favorite baseball fields.

## Features

- **Field Selection**: Choose from any baseball field within the NACC Division 3 baseball conference.
- **Favorites**: Easily add and access your favorite baseball fields for quick weather updates.
- **Wind Direction**: Get real-time updates on the wind direction relative to the orientation of the selected baseball field.
- **Wind Speed & Temperature**: Stay informed about the current wind speed and temperature at your chosen location.

## Getting Started

### Prerequisites

- Flutter SDK
- Dart
- An API key from OpenWeatherMap (https://api.openweathermap.org)

### Installation

1. Clone the repository to your local machine.
2. Open the project in your preferred Flutter development environment.
3. Add your OpenWeatherMap API key to the designated file in the project (see API Key Configuration).
4. Run `flutter pub get` to install all the dependencies.
5. Build and run the app on your device or emulator.

### API Key Configuration

- Obtain an API key from OpenWeatherMap (https://api.openweathermap.org).
- Navigate to `<project_root>/lib/config/`.
- Create a file named `api_keys.dart` if it doesn't exist.
- Add the following line, replacing `<YOUR_API_KEY>` with your actual API key:
  ```dart
  const String OPEN_WEATHER_MAP_API_KEY = '<YOUR_API_KEY>';

### Usage

Launch the app and select a baseball field from the list or add it to your favorites for quicker access.
View the real-time weather data, including wind direction, speed, and temperature, displayed on the app's main screen.
Use this information to plan your game strategies or visits accordingly.

### Contributing

Contributions to the Baseball Weather App are welcome! If you have suggestions for improvements or new features, feel free to open an issue or submit a pull request.

### Acknowledgements

NACC Division 3 Baseball Conference
OpenWeatherMap API (https://api.openweathermap.org)
Flutter Community
