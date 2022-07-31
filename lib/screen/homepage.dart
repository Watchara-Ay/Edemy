import 'package:edgroup/components/logout.dart';
import 'package:edgroup/data/api/models/response/course_model.dart';
import 'package:edgroup/data/api/services/course_service.dart';
import 'package:edgroup/screen/coursedetail.dart';
import 'package:edgroup/screen/coursedetail2.dart';
import 'package:edgroup/screen/coursedetail4.dart';
import 'package:flutter/material.dart';

import '../components/categorries.dart';
import 'coursedetail3.dart';

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  String filterType = "MATH";
  String taskPop = "close";

  late Future<List<Course>> courses;
  CourseService courseService = CourseService();

  @override
  void initState() {
    super.initState();

    // fetch the necessary data
    courses = courseService.getCourseList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 1.5,
                    height: MediaQuery.of(context).size.height / 7,
                    alignment: Alignment.topLeft,
                    child: const Text(
                      "Hi welcome you all to learn in our app",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 3,
                    height: MediaQuery.of(context).size.height / 7,
                    alignment: Alignment.topLeft,
                    child: Image.asset("assets/images/academy.png"),
                  ),
                ],
              ),
              Container(
                height: 20,
              ),
              Categories(),

              Expanded(
                child: FutureBuilder<List<Course>>(
                  future: courses,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return _buildCourseList(context, snapshot.data ?? []);
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    }

                    // By default, show a loading spinner.
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        CircularProgressIndicator(
                          color: Colors.black38,
                        )
                      ],
                    );
                  },
                ),
              ),

              Container(
                  color: Color.fromARGB(255, 218, 255, 233),
                  height: MediaQuery.of(context).size.height / 12,
                  alignment: Alignment.centerRight,
                  child:
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Logout(),
                      ],
                    ),
                  ])),
            ],
          ),
        ],
      ),
    );
  }

  ListView _buildCourseList(BuildContext context, List<Course> courses) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 24,
      ),
      itemCount: courses.length,
      itemBuilder: (context, index) {
        var course = courses[index];

        return ElevatedButton(
          style: ButtonStyle(
            padding: MaterialStateProperty.all(
                const EdgeInsets.only(
                    left: 35, right: 35, top: 15, bottom: 15)),
            shape:
                MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40.0),
              ),
            ),
            backgroundColor: MaterialStateProperty.all(
              const Color.fromARGB(255, 0, 255, 204)
            ),
          ),
          child: Text(
            course.name,
            style: const TextStyle(fontSize: 16, color: Colors.black),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => coursedetail(
                  courseData: course,
                ),
              ),
            );
          },
        );

      },
    );
  }
}
