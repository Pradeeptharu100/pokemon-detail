# Pokémon Details App

A Flutter application that integrates with the Pokémon API to fetch and display detailed information about various Pokémon. The app uses state management with `flutter_bloc`, responsive UI with `flutter_screenutil`, and makes network requests via the `http` package.

## Features

- Search for Pokémon by name or ID.
- Display Pokémon details, including name, image, abilities, base experience, height, and weight.
- Responsive design for various screen sizes.

## Screenshots
  ![WhatsApp Image 2024-11-15 at 10 52 29_b7e02254](https://github.com/user-attachments/assets/2648ae67-dc96-4ab6-8973-5ae585fa5aed)
  - Inital Screen

  ![WhatsApp Image 2024-11-15 at 10 52 29_6535923e](https://github.com/user-attachments/assets/de78859e-c029-480e-b9b7-5a56dfd8974a)
  - Detail Screen

![WhatsApp Image 2024-11-15 at 10 52 29_a970df52](https://github.com/user-attachments/assets/8ef8d3f9-d27e-40bc-ab4f-4a82d5b5ef18)
- Not found screen


## Dependencies

This project uses the following dependencies:

- **[flutter](https://flutter.dev/)**: The SDK for building natively compiled applications for mobile, web, and desktop from a single codebase.
- **[cupertino_icons](https://pub.dev/packages/cupertino_icons)**: Provides Cupertino-style icons, used primarily on iOS.
- **[http](https://pub.dev/packages/http)**: A simple package to make HTTP requests and fetch data from APIs.
- **[flutter_bloc](https://pub.dev/packages/flutter_bloc)**: State management solution based on the BLoC (Business Logic Component) pattern, which helps to handle the application's state.
- **[flutter_screenutil](https://pub.dev/packages/flutter_screenutil)**: A package that helps to create responsive UIs across different screen sizes.

## Usage
- Search: Enter a Pokémon name or ID in the search bar to fetch its details.
- Display: The app displays detailed information about the Pokémon, such as its name, image, abilities, base experience, height, and weight.
  
 ## Project Structure
- lib/models/: Contains the models representing Pokémon data.
- lib/bloc/: Manages state and events using the BLoC pattern.
- lib/repositories/: Handles API requests to fetch Pokémon details.
- lib/views/: Holds the UI for displaying Pokémon information and search functionality.

In your `pubspec.yaml`, dependencies should be listed as follows:

```yaml
dependencies:
  http: ^1.2.2
  flutter_bloc: ^8.1.6
  flutter_screenutil: ^5.9.3 


Installation
To get started with the project:

Clone this repository:

git clone https://github.com/yourusername/pokemon-details-app.git
cd pokemon-details-app

Install dependencies:

flutter pub get
Run the application:

flutter run

