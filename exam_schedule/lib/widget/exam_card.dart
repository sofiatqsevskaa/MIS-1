import 'package:flutter/material.dart';
import '../model/exam.dart';
import 'package:intl/intl.dart';

class ExamCard extends StatelessWidget {
  final Exam exam;

  const ExamCard({required this.exam});

  @override
  Widget build(BuildContext context) {
    final isPast = exam.dateTime.isBefore(DateTime.now());
    final color = isPast ? Colors.grey[300] : Colors.green[100];
    final textColor = isPast ? Colors.black54 : Colors.black;

    return Card(
      color: color,
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              exam.subjectName,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.calendar_today, size: 18),
                const SizedBox(width: 6),
                Text(
                  DateFormat('dd.MM.yyyy – HH:mm').format(exam.dateTime),
                  style: TextStyle(color: textColor),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(Icons.room, size: 18),
                const SizedBox(width: 6),
                Text(exam.rooms.join(', '), style: TextStyle(color: textColor)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
