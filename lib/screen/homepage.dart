import 'package:edgroup/components/logout.dart';
import 'package:edgroup/data/api/models/response/course_model.dart';
import 'package:edgroup/data/api/services/auth_service.dart';
import 'package:edgroup/data/api/services/course_service.dart';
import 'package:edgroup/screen/addPage.dart';
import 'package:edgroup/screen/authentication/auth_redirect.dart';
import 'package:edgroup/screen/coursedetail.dart';
import 'package:flutter/material.dart';

import '../components/categorries.dart';

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  String filterType = "MATH";
  String taskPop = "close";

  AuthService authService = AuthService();

  List<Course> courses = [];
  CourseService courseService = CourseService();
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();
  @override
  void initState() {
    super.initState();

    // fetch the necessary data
    //courses = courseService.getCourseList();
    refreshdata();
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
                    padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
                    child: const Text(
                      "Hi",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 15, 10, 0),
                    child: Image.asset("assets/images/academy.png"),
                    width: MediaQuery.of(context).size.width / 3,
                    height: MediaQuery.of(context).size.height / 7,
                    alignment: Alignment.topLeft,
                  ),
                ],
              ),
              Categories(),
              Expanded(
                child: Container(
                  color: Color.fromARGB(255, 218, 255, 233),
                  child: _buildCourseList(context, courses),
                  // child: FutureBuilder<List<Course>>(
                  //   builder: (context, snapshot) {
                  //     if (snapshot.hasData) {
                  //       return _buildCourseList(context, snapshot.data ?? []);
                  //     } else if (snapshot.hasError) {
                  //       return Text('${snapshot.error}');
                  //     }

                  //     // By default, show a loading spinner.
                  //     return Column(
                  //       mainAxisSize: MainAxisSize.min,
                  //       children: const [
                  //         CircularProgressIndicator(
                  //           color: Colors.black38,
                  //         ),
                  //       ],
                  //     );
                  //   },
                  // ),
                ),
              ),
              Container(
                color: Color.fromARGB(255, 218, 255, 233),
                padding: EdgeInsets.all(15),
                child: Row(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: ElevatedButton(
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
                              const Color.fromARGB(255, 247, 220, 111)),
                        ),
                        child: const Text("Add",
                            style:
                                TextStyle(fontSize: 16, color: Colors.black)),
                        onPressed: () {
                          add();
                        },
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 2.8,
                    ),
                    Container(
                        color: Color.fromARGB(255, 218, 255, 233),
                        height: MediaQuery.of(context).size.height / 12,
                        alignment: Alignment.centerRight,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Logout(
                                    onLogoutPressed: () {
                                      logoutAndRestartApp();
                                    },
                                  ),
                                ],
                              ),
                            ])),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCourseList(BuildContext context, List<Course> courses) {
    return RefreshIndicator(
      key: _refreshIndicatorKey,
      onRefresh: () async {
        await refreshdata();
      },
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 24,
        ),
        itemCount: courses.length,
        itemBuilder: (context, index) {
          var course = courses[index];

          return Container(
            margin: const EdgeInsets.all(15.0),
            padding: const EdgeInsets.all(3.0),
            decoration: BoxDecoration(
                border: Border.all(color: Color.fromARGB(255, 255, 68, 68))),
            height: 50,
            child: ElevatedButton(
              style: ButtonStyle(
                padding: MaterialStateProperty.all(const EdgeInsets.only(
                    left: 35, right: 35, top: 15, bottom: 15)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                ),
                backgroundColor: MaterialStateProperty.all(
                    const Color.fromARGB(255, 0, 255, 204)),
              ),
              child: Text(
                course.name,
                style: const TextStyle(fontSize: 16, color: Colors.black),
              ),
              onPressed: () {
                viewdetail(course);
              },
            ),
          );
        },
      ),
    );
  }

  Future<void> refreshdata() async {
    var result = await courseService.getCourseList();
    setState(() {
      courses = result;
    });
  }

  void logoutAndRestartApp() async {
    await authService.logout();

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const AuthRedirectScreen()),
      (route) => false,
    );
  }

  void add() async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const addPage()),
    );
    _refreshIndicatorKey.currentState?.show();
  }

  void viewdetail(Course course) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => coursedetail(
          courseData: course,
        ),
      ),
    );
    _refreshIndicatorKey.currentState?.show();
  }
}
