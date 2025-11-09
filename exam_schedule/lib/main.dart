import 'package:flutter/material.dart';
import 'view/exam_list.dart';

void main() {
  runApp(const ExamApp());
}

class ExamApp extends StatelessWidget {
  const ExamApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Exam Schedule',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ExamList(),
    );
  }
}
