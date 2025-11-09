import 'package:flutter/material.dart';
import '../model/exam.dart';
import '../widget/exam_card.dart';
import 'exam_details.dart';

class ExamList extends StatelessWidget {
  final List<Exam> exams = [
    Exam(
      subjectName: 'Структурно програмирање',
      dateTime: DateTime(2025, 2, 4, 8, 30),
      rooms: ['A3'],
    ),
    Exam(
      subjectName: 'Објектно ориентирано програмирање',
      dateTime: DateTime(2026, 2, 3, 9, 0),
      rooms: ['Lab 2'],
    ),
    Exam(
      subjectName: 'Математичка анализа',
      dateTime: DateTime(2026, 2, 5, 10, 0),
      rooms: ['A1'],
    ),
    Exam(
      subjectName: 'Вештачка интелигенција',
      dateTime: DateTime(2025, 5, 10, 9, 0),
      rooms: ['A1'],
    ),
    Exam(
      subjectName: 'Бази на податоци',
      dateTime: DateTime(2025, 7, 12, 10, 0),
      rooms: ['B3', 'B4'],
    ),
    Exam(
      subjectName: 'Алгоритми и податочни структури',
      dateTime: DateTime(2025, 1, 15, 8, 30),
      rooms: ['C2'],
    ),
    Exam(
      subjectName: 'Компјутерски мрежи',
      dateTime: DateTime(2025, 3, 18, 9, 30),
      rooms: ['Lab 1'],
    ),
    Exam(
      subjectName: 'Оперативни системи',
      dateTime: DateTime(2025, 2, 20, 11, 0),
      rooms: ['A2'],
    ),
    Exam(
      subjectName: 'Машинско учење',
      dateTime: DateTime(2025, 11, 25, 9, 0),
      rooms: ['C1'],
    ),
    Exam(
      subjectName: 'Калкулус 1',
      dateTime: DateTime(2025, 4, 28, 10, 0),
      rooms: ['B2'],
    ),
    Exam(
      subjectName: 'Калкулус 2',
      dateTime: DateTime(2025, 11, 25, 9, 0),
      rooms: ['C1'],
    ),
    Exam(
      subjectName: 'Дигитизација',
      dateTime: DateTime(2025, 4, 28, 10, 0),
      rooms: ['B2'],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    exams.sort((a, b) => a.dateTime.compareTo(b.dateTime));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Распоред за испити - 226010'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: exams.length,
        itemBuilder: (context, index) {
          final exam = exams[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => ExamDetailScreen(exam: exam)),
              );
            },
            child: ExamCard(exam: exam),
          );
        },
      ),
      bottomNavigationBar: Container(
        color: Colors.blue,
        padding: const EdgeInsets.all(12),
        child: Text(
          'Вкупно испити: ${exams.length}',
          style: const TextStyle(color: Colors.white, fontSize: 16),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
