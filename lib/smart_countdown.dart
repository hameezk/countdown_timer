library smart_countdown;

import 'package:flutter/material.dart';

// CountdownWidget is a StatefulWidget that displays a countdown timer until a specified end date.
class CountdownWidget extends StatefulWidget {
  final DateTime endDate; // The date and time when the countdown ends.
  final String?
      completedText; // Text to display when the countdown is complete.
  final TextStyle? timerStyle; // Style for the timer text.
  final Color? timerColor; // Color for the timer text.
  final bool? hideZeroValues; // Flag to determine whether to hide zero values.

  const CountdownWidget(
    this.endDate, {
    super.key,
    this.completedText,
    this.timerStyle,
    this.timerColor,
    this.hideZeroValues = true, // Default to hiding zero values.
  });

  @override
  State<CountdownWidget> createState() => _CountdownWidgetState();
}

class _CountdownWidgetState extends State<CountdownWidget> {
  // Stream that emits the remaining seconds until the countdown ends.
  Stream<int> timerStream(DateTime endTime) async* {
    while (endTime.isAfter(DateTime.now())) {
      yield endTime
          .difference(DateTime.now())
          .inSeconds; // Yield remaining seconds.
      await Future.delayed(const Duration(
          seconds: 1)); // Wait for one second before the next update.
    }
  }

  // Format the duration into a readable string.
  String formatDuration(int days, int hours, int minutes, int seconds) {
    String result = '';
    String twoDigits(int n) =>
        n.toString().padLeft(2, '0'); // Ensure two-digit formatting.

    if (widget.hideZeroValues ?? true) {
      // Check if hiding zero values is enabled.
      if (days > 0) {
        result += '$days Days';
      }
      if (hours > 0) {
        if (result.isNotEmpty) result += ', ';
        result += '${twoDigits(hours)} Hours';
      }

      if (minutes > 0) {
        if (result.isNotEmpty) result += ', ';
        result += '${twoDigits(minutes)} Minutes';
      }
      if (seconds > 0) {
        if (result.isNotEmpty) result += ', ';
        result += '${twoDigits(seconds)} Seconds';
      }
    } else {
      // If zero values should not be hidden.
      result += '$days Days';
      if (result.isNotEmpty) result += ', ';
      result += '${twoDigits(hours)} Hours';
      if (result.isNotEmpty) result += ', ';
      result += '${twoDigits(minutes)} Minutes';
      if (result.isNotEmpty) result += ', ';
      result += '${twoDigits(seconds)} Seconds';
    }
    return result; // Return the formatted duration string.
  }

  // Calculate and format time from total seconds.
  String formatTime(int totalSeconds) {
    int days = totalSeconds ~/ 86400; // Calculate days.
    int hours = (totalSeconds % 86400) ~/ 3600; // Calculate hours.
    int minutes = (totalSeconds % 3600) ~/ 60; // Calculate minutes.
    int seconds = totalSeconds % 60; // Calculate seconds.
    if (totalSeconds == 0) {} // Placeholder for zero seconds, if needed.
    return formatDuration(
        days, hours, minutes, seconds); // Format the calculated time.
  }

  @override
  Widget build(BuildContext context) {
    // Build the countdown widget using a StreamBuilder.
    return StreamBuilder<int>(
      stream: timerStream(widget.endDate), // Connect to the timer stream.
      builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          // If the countdown is complete, display the completion text.
          return Text(
            widget.completedText ??
                'Time Completed!', // Default text if none provided.
            style: widget.timerStyle ?? // Use provided style or default style.
                TextStyle(
                    fontSize: 14,
                    color: widget.timerColor ?? Colors.grey,
                    fontWeight: FontWeight.w700),
          );
        } else {
          if (snapshot.hasData) {
            // If data is available, display the remaining time.
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  formatTime(
                      snapshot.data ?? 0), // Format and display remaining time.
                  style: widget.timerStyle ??
                      TextStyle(
                          fontSize: 14,
                          color: widget.timerColor ?? Colors.grey,
                          fontWeight: FontWeight.w700),
                ),
              ],
            );
          } else {
            // If no data is available, display a default time.
            return Text(
              '00:00:00', // Default display for no data.
              style: widget.timerStyle ??
                  TextStyle(
                      fontSize: 14,
                      color: widget.timerColor ?? Colors.grey,
                      fontWeight: FontWeight.w700),
            );
          }
        }
      },
    );
  }
}
