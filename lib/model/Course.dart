import 'package:flutter/material.dart';

class Course {
  final String title, description;
  final int price, size, id;
  final Color color;
  Course({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.size,
    required this.color,
  });
}

List<Course> products = [
  Course(
      id: 1,
      title: "Office Code",
      price: 234,
      size: 12,
      description: dummyText,
      color: Color(0xFF3D82AE)),
  Course(
      id: 2,
      title: "Belt Bag",
      price: 234,
      size: 8,
      description: dummyText,
      color: Color(0xFFD3A984)),
  Course(
      id: 3,
      title: "Hang Top",
      price: 234,
      size: 10,
      description: dummyText,
      color: Color(0xFF989493)),
  Course(
      id: 4,
      title: "Old Fashion",
      price: 234,
      size: 11,
      description: dummyText,
      color: Color(0xFFE6B398)),
  Course(
      id: 5,
      title: "Office Code",
      price: 234,
      size: 12,
      description: dummyText,
      color: Color(0xFFFB7883)),
  Course(
    id: 6,
    title: "Office Code",
    price: 234,
    size: 12,
    description: dummyText,
    color: Color(0xFFAEAEAE),
  ),
];

String dummyText =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.";
