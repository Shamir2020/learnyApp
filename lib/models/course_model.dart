
class Course{
  final String id;
  final String title;
  final String description;
  final String courseCode;
  final String category;
  final String courseImage;
  List teachers;
  List students;
  List reviews;
  List enrollRequests;

  Course({
    required this.id, required this.title, required this.description, required this.courseCode, required this.category,
    required this.courseImage, required this.teachers, required this.students,
    required this.reviews, required this.enrollRequests
  });

}