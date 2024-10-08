
# Countdown Timer Plugin

A Flutter plugin to display a customizable countdown timer widget that counts down to a specific `endDate`. The plugin supports text customization, color options, and auto-refreshing every second.

## Demo
- MacOS
  
https://github.com/user-attachments/assets/c4f100c6-2d42-4f19-aa4e-f3821623769d

- Web
  
https://github.com/user-attachments/assets/6c218998-ac94-44ea-8ca0-fba6576dbf22

- IOS
  
https://github.com/user-attachments/assets/a96d6c35-5b32-4d4d-8671-f377beea85bc



## Features

- Displays a countdown timer.
- Customizable styles for text and colors.
- Option to hide zero values for days, hours, minutes, and seconds.
- Easy-to-use widget for cross-platform support on Android, iOS, web, macOS, Linux, and Windows.

## Table of Contents

- [Installation](#installation)
- [Usage](#usage)
- [Customization Options](#customization-options)
- [Examples](#examples)
- [Contributing](#contributing)
- [License](#license)

## Installation

Add the following line to your `pubspec.yaml` file under `dependencies`:

```yaml
dependencies:
  smart_countdown: ^1.0.0
```

Then, run the following command:

```bash
flutter pub get
```

### Local Development

If you're using this plugin locally (during development), add the path to the plugin:

```yaml
dependencies:
  smart_countdown:
    path: ../smart_countdown
```

## Usage

To use the plugin in your Flutter app, import the package and use the `CountdownWidget` widget:

```dart
import 'package:smart_countdown/smart_countdown.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DateTime endDate = DateTime.now().add(Duration(days: 1, hours: 5));

    return Scaffold(
      appBar: AppBar(
        title: Text("Countdown Timer Example"),
      ),
      body: Center(
        child: CountdownWidget(
          endDate,
          completedText: "Countdown Complete!",
          timerStyle: TextStyle(fontSize: 18, color: Colors.blue),
          hideZeroValues: true,
        ),
      ),
    );
  }
}
```

### `CountdownWidget` Parameters

| Parameter         | Type           | Default               | Description                                                                 |
|-------------------|----------------|-----------------------|-----------------------------------------------------------------------------|
| `endDate`         | `DateTime`     | Required              | The date and time the countdown will end.                                   |
| `completedText`   | `String?`      | `"Time Completed!"`   | Text to display when the countdown ends.                                    |
| `timerStyle`      | `TextStyle?`   | `null`                | The style to apply to the countdown text (font size, weight, etc.).          |
| `timerColor`      | `Color?`       | `Colors.grey`         | The color of the countdown text.                                            |
| `hideZeroValues`  | `bool?`        | `false`               | If `true`, it hides zero values (e.g., hours, minutes, etc. when they are zero). |

## Customization Options

1. **`completedText`**: This parameter allows you to set custom text when the countdown is over. For example:
   ```dart
   completedText: "Event Started!"
   ```

2. **`timerStyle`**: Customize the countdown timer's text appearance by passing a `TextStyle`:
   ```dart
   timerStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red)
   ```

3. **`timerColor`**: Change the countdown timer's color using the `timerColor` parameter:
   ```dart
   timerColor: Colors.blueAccent
   ```

4. **`hideZeroValues`**: If you want to hide sections of the countdown when they reach zero (e.g., hiding `00 Days`), set `hideZeroValues` to `true`:
   ```dart
   hideZeroValues: true
   ```

## Examples

### Basic Countdown Timer

```dart
import 'package:flutter/material.dart';
import 'package:smart_countdown/smart_countdown.dart';

class CountdownPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DateTime endDate = DateTime.now().add(Duration(days: 1, hours: 5));

    return Scaffold(
      appBar: AppBar(
        title: Text("Basic Countdown Timer"),
      ),
      body: Center(
        child: CountdownWidget(
          endDate,
        ),
      ),
    );
  }
}
```

### Customized Countdown Timer

```dart
import 'package:flutter/material.dart';
import 'package:smart_countdown/smart_countdown.dart';

class CustomCountdownPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DateTime endDate = DateTime.now().add(Duration(hours: 2, minutes: 45));

    return Scaffold(
      appBar: AppBar(
        title: Text("Customized Countdown Timer"),
      ),
      body:Center(
        child: CountdownWidget(
          endDate,
          completedText: "Countdown Complete!",
          timerStyle: const TextStyle(fontSize: 18, color: Colors.red),
          timerColor: Colors.red,
          hideZeroValues: true,
        ),
      ),
    );
  }
}
```

### Countdown Timer with Days

```dart
import 'package:flutter/material.dart';
import 'package:smart_countdown/smart_countdown.dart';

class DaysCountdownPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DateTime endDate = DateTime.now().add(Duration(days: 7));

    return Scaffold(
      appBar: AppBar(
        title: Text("Countdown Timer with Days"),
      ),
      body:Center(
        child: CountdownWidget(
          endDate,
          completedText: "Countdown Complete!",
          timerStyle: const TextStyle(fontSize: 18, color: Colors.red),
          timerColor: Colors.red,
          hideZeroValues: true,
        ),
      ),
    );
  }
}
```

## Contributing

Contributions are welcome! Please submit a pull request if you'd like to contribute to the plugin.

### Steps to Contribute:

1. Fork the repository.
2. Create a new branch (`git checkout -b feature/my-feature`).
3. Make your changes and commit them (`git commit -m 'Add some feature'`).
4. Push to the branch (`git push origin feature/my-feature`).
5. Open a pull request.

Feel free to submit issues or feature requests. Please make sure all code submissions adhere to the [Effective Dart](https://dart.dev/guides/language/effective-dart) guidelines.

## License

This plugin is licensed under the MIT License. See the [LICENSE](./LICENSE) file for more details.
