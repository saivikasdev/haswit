import 'package:flutter/material.dart';

class Service {
  final int id;
  final String title, image;
  final Color color;

  Service({required this.id, required this.title, required this.image, required this.color});
}

// For demo list of service
List<Service> services = [
  Service(
    id: 1,
    title: "Home",
    image: "assets/images/home.jpg",
    color: Color(0xFFD9FFFC),
  ),
  Service(
    id: 2,
    title: "My courses",
    image: "assets/images/favorite.png",
    color: Color(0xFFE4FFC7),
  ),
  Service(
    id: 3,
    title: "Notifications",
    image: "assets/images/bell.png",
    color: Color(0xFFFFF3DD),
  ),
  Service(
    id: 4,
    title: "Saved items",
    image: "assets/images/bookmark.png",
    color: Color(0xFFFFF3DD),
  ),
];
