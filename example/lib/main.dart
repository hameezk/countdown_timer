import 'package:countdown_timer/countdown_timer.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime endDate = DateTime.now()
        .add(const Duration(days: 2, hours: 0, minutes: 0, seconds: 50));

    return Scaffold(
      appBar: AppBar(
        title: const Text("Countdown Timer Example"),
      ),
      body: Center(
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
