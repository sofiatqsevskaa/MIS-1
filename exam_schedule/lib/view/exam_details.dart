import 'package:flutter/material.dart';
import '../model/exam.dart';
import 'package:intl/intl.dart';

class ExamDetailScreen extends StatelessWidget {
  final Exam exam;

  const ExamDetailScreen({required this.exam});

  String timeRemaining() {
    final now = DateTime.now();
    if (exam.dateTime.isBefore(now)) return 'Испитот е веќе одржан';
    final diff = exam.dateTime.difference(now);
    final days = diff.inDays;
    final hours = diff.inHours % 24;
    return '$days дена, $hours часа';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(exam.subjectName)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Предмет: ${exam.subjectName}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Text(
              'Датум и време: ${DateFormat('dd.MM.yyyy – HH:mm').format(exam.dateTime)}',
            ),
            const SizedBox(height: 8),
            Text('Простории: ${exam.rooms.join(', ')}'),
            const SizedBox(height: 20),
            Text(
              'Преостанато време: ${timeRemaining()}',
              style: const TextStyle(fontSize: 16, color: Colors.blue),
            ),
          ],
        ),
      ),
    );
  }
}
