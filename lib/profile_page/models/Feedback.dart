import 'package:flutter/material.dart';

class Feedback {
  final String name, review, userPic, course;
  final int id;
  final Color color;

  Feedback(
      {required this.name, required this.review, required this.userPic, 
      required this.id, required this.color, required this.course});
}

// List of demo feedbacks
List<Feedback> feedbacks = [
  Feedback(
    id: 1,
    course: "html",
    name: "Ronald Thompson",
    review: review,
    userPic: "assets/images/html.png",
    color: Color(0xFFFFF3DD),
  ),
  Feedback(
    id: 2,
    course: "python",
    name: "Mohammed Muzafer",
    review: review,
    userPic: "assets/images/python.jpg",
    color: Color(0xFFD9FFFC),
  ),
  Feedback(
    id: 3,
    name: "Swetha reddy",
    course: "flutter",
    review: review,
    userPic: "assets/images/flutter.jpg",
    color: Color(0xFFFFE0E0),
  ),
];

String review =
    'Flutter is app development framework whhich is developing hugely in nowadays you can build android,web,ios,windows,IOT applications with same code and had more advantages It provides huge jobs and salaries all over india and other countries you can become and android or web or ios developer with flutter';
