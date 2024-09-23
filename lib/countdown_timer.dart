library countdown_timer;

import 'package:flutter/material.dart';

class CountdownWidget extends StatefulWidget {
  final DateTime endDate;
  final String? completedText;
  final TextStyle? timerStyle;
  final Color? timerColor;
  final bool? hideZeroValues;
  const CountdownWidget(
    this.endDate, {
    super.key,
    this.completedText,
    this.timerStyle,
    this.timerColor,
    this.hideZeroValues = true,
  });

  @override
  State<CountdownWidget> createState() => _CountdownWidgetState();
}

class _CountdownWidgetState extends State<CountdownWidget> {
  Stream<int> timerStream(DateTime endTime) async* {
    while (endTime.isAfter(DateTime.now())) {
      yield endTime.difference(DateTime.now()).inSeconds;
      await Future.delayed(const Duration(seconds: 1));
    }
  }

  String formatDuration(int days, int hours, int minutes, int seconds) {
    String result = '';
    String twoDigits(int n) => n.toString().padLeft(2, '0');

    if (widget.hideZeroValues ?? true) {
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
      result += '$days Days';
      if (result.isNotEmpty) result += ', ';
      result += '${twoDigits(hours)} Hours';
      if (result.isNotEmpty) result += ', ';
      result += '${twoDigits(minutes)} Minutes';
      if (result.isNotEmpty) result += ', ';
      result += '${twoDigits(seconds)} Seconds';
    }
    return result;
  }

  String formatTime(int totalSeconds) {
    int days = totalSeconds ~/ 86400;
    int hours = (totalSeconds % 86400) ~/ 3600;
    int minutes = (totalSeconds % 3600) ~/ 60;
    int seconds = totalSeconds % 60;
    if (totalSeconds == 0) {}
    return formatDuration(days, hours, minutes, seconds);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      stream: timerStream(widget.endDate),
      builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Text(
            widget.completedText ?? 'Time Completed!',
            style: widget.timerStyle ??
                TextStyle(
                    fontSize: 14,
                    color: widget.timerColor ?? Colors.grey,
                    fontWeight: FontWeight.w700),
          );
        } else {
          if (snapshot.hasData) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  formatTime(snapshot.data ?? 0),
                  style: widget.timerStyle ??
                      TextStyle(
                          fontSize: 14,
                          color: widget.timerColor ?? Colors.grey,
                          fontWeight: FontWeight.w700),
                ),
              ],
            );
          } else {
            return Text(
              '00:00:00',
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
