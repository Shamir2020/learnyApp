
import 'package:learny/models/courseContent_model.dart';

class Lecture{
  final String title;
  final dynamic lectureNumber;
  final String content;
  final String videoUrl;
  final String courseContent;

  Lecture({
    required this.title, required this.lectureNumber, required this.content, required this.videoUrl,
    required this.courseContent
  });

}