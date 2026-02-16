# Weather App

A Flutter weather app that fetches current conditions and forecast data based on the user's location.

## Screenshots

<table>
  <tr>
    <td valign="top"><img src="./assets/Screenshot_20240212_181527.png" /></td>
    <td valign="top"><img src="./assets/Screenshot_20240212_181731.png" /></td>
  </tr>
</table>

## Features

- Current weather by geolocation
- Multi-day forecast
- Wind speed and humidity details
- Location permission flow
- Error handling with retry option

## Tech Stack

- Flutter + Dart
- BLoC-style state management with Streams
- GetIt for dependency injection
- Dio for HTTP requests
- Geolocator for device location
- flutter_dotenv for environment variables
- json_serializable/json_annotation for model serialization

## Project Structure

```text
lib/
  app/          # App bootstrap and dependency injection
  data/         # API client, providers, repository, mappers, models
  domain/       # Domain entities
  presenter/    # UI, resources, widgets, and bloc layer
```

## Getting Started

### Prerequisites

- Flutter SDK installed
- A valid weather API key

### Setup

1. Install dependencies:

```bash
flutter pub get
```

2. Create a `.env` file in the project root:

```env
API_KEY=your_api_key_here
```

3. Run the app:

```bash
flutter run
```

## Testing

```bash
flutter test
```

## Notes

- The app requires location permission to load weather data.
- The `.env` file is ignored by Git by default.
