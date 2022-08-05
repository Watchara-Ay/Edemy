import 'dart:convert';
import 'dart:developer';

import 'package:edgroup/data/api/constants.dart';
import 'package:edgroup/data/api/models/response/course_model.dart';
import 'package:http/http.dart' as http;

class CourseService {
  Future<List<Course>> getCourseList() async {
    var response = await http.get(Uri.parse(ApiConstants.HOST + '/courses'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return json
          .decode(response.body)
          .map<Course>((listItem) => Course.fromJson(listItem))
          .toList();
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  // Future<bool> updateCourse(String name, String courseDetail) async {
  //   var response = await http.put(
  //     Uri.parse(ApiConstants.HOST + '/courses'),
  //     body: {'name': name, 'courseDetail': courseDetail},
  //   );

  //   log(response.body);
  // }
}
