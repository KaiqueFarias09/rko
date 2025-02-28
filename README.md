# RKO: Emergency Resuscitation Assistant

## Project Overview

RKO is a Flutter-based mobile application designed to provide step-by-step guidance for cardiopulmonary resuscitation (CPR) and emergency first aid procedures. The application serves as a critical support tool during emergency situations, offering audio-visual guidance through the resuscitation process with a focus on accessibility and ease of use under stress.

The application guides users through the complete resuscitation workflow, from securing the area and checking vital signs to performing CPR techniques including chest compressions and rescue breathing. Its primary purpose is to assist individuals with limited medical training in performing life-saving procedures correctly while emergency services are en route.

![WhatsApp Image 2025-02-28 at 10 26 08](https://github.com/user-attachments/assets/120b69d7-33d6-4bd7-b82a-362a3b8f78ed)

## Key Features

- **Step-by-Step Emergency Guidance**: Sequential screens guide users through the complete resuscitation protocol
- **Multi-Modal Instructions**: Combines visual illustrations, animations, and audio guidance
- **Audio Guidance**: Voice instructions that allow users to focus on the patient while following directions
- **Visual Demonstrations**: SVG illustrations and Lottie animations demonstrating proper techniques
- **CPR Rhythm Assistant**: Built-in counter to help maintain the correct cadence for chest compressions
- **Emergency Services Integration**: Quick-access functionality to contact emergency services

![WhatsApp Image 2025-02-28 at 10 27 08](https://github.com/user-attachments/assets/ae74a2b2-26fb-4a7b-90bb-23a3bfab2c1f)


### Lib Directory

The `lib` directory contains all Dart source code, organized according to feature and responsibility:

```
lib/
├── core/                      # Core application components
│   ├── colors/                # Color schemes
│   ├── constants/             # Application-wide constants
│   ├── dimensions/            # UI spacing and sizing constants
│   ├── icons/                 # Custom icon definitions
│   ├── l10n/                  # Localization resources
│   └── typography/            # Text styling and typography
├── main.dart                  # Application entry point
└── presentation/             # UI layer components
    ├── bloc/                  # State management
    ├── routes/                # Navigation routing
    ├── views/                 # Screen implementations
    └── widgets/               # Reusable UI components
```

#### Presentation Directory
Contains all UI-related code organized by feature:

- **bloc**: State management using the BLoC pattern, with specific focus on audio playback control
- **routes**: Navigation configuration and route generation
- **views**: Screen implementations for each step of the resuscitation protocol:
- **widgets**: Reusable UI components:
  - Button variants (primary, secondary, tertiary, alert)
  - Navigation components (appbar, bottom navigation, drawer)
  - Audio playback interface components
  - Specialized scaffolds for different screen types

![WhatsApp Image 2025-02-28 at 10 26 09](https://github.com/user-attachments/assets/5c3a458f-6fe8-4146-aae8-1db5cbf63ba9)

## Setup Instructions

### Prerequisites
- Flutter SDK ≥3.3.0
- Dart SDK ≥3.3.0
- Android Studio or VS Code with Flutter extensions

## Dependencies

The application relies on several key packages:

- **flutter_bloc**: State management using the BLoC pattern
- **just_audio**: Audio playback for voice guidance
- **lottie**: Animation rendering from JSON files
- **flutter_svg**: SVG rendering for illustrations
- **intl**: Internationalization support
- **url_launcher**: Integration with phone dialer for emergency calls
- **freezed**: Immutable state class generation
- **page_transition**: Custom screen transitions

## License

This project is a student-created application and is intended for educational purposes. Please refer to the included license file for usage terms.
