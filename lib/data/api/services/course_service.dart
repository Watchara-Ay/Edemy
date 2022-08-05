import 'dart:convert';
import 'dart:developer';

import 'package:edgroup/data/api/constants.dart';
import 'package:edgroup/data/api/models/response/add_response.dart';
import 'package:edgroup/data/api/models/response/course_model.dart';
import 'package:edgroup/data/api/models/response/update_response.dart';
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

  Future<bool> addCourse(String name, String courseDetail) async {
    var response = await http.post(
      Uri.parse(ApiConstants.HOST + '/course'),
      body: {'name': name, 'courseDetail': courseDetail},
    );

    log('response: ${response.body}');
    if (response.statusCode == 200) {
      var addresponse = addResponse.fromJson(json.decode(response.body));
      return true;
    } else {
      return false;
    }
  }

  Future<bool> updateCourse(int id, String name, String courseDetail) async {
    var response = await http.put(
      Uri.parse(ApiConstants.HOST + '/course/$id'),
      body: {'name': name, 'courseDetail': courseDetail},
    );

    log('response: ${response.body}');
    if (response.statusCode == 200) {
      var updateresponse = updateResponse.fromJson(json.decode(response.body));
      return true;
    } else {
      return false;
    }
  }

  Future<bool> deleteCourse(int id) async {
    var response = await http.delete(
      Uri.parse(ApiConstants.HOST + '/course/$id'),
    );

    log('response: ${response.body}');
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
