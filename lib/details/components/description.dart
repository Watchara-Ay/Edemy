import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../model/Course.dart';

class Description extends StatelessWidget {
  const Description({
    required Key key,
    required this.course,
  }) : super(key: key);

  final Course course;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
      child: Text(
        course.description,
        style: TextStyle(height: 1.5),
      ),
    );
  }
}
