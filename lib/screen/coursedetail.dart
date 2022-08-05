import 'dart:developer';

import 'package:flutter/material.dart';

import '../data/api/models/response/course_model.dart';
import '../data/api/services/course_service.dart';
import '../ui/shared/progress_dialog.dart';
import 'editPage.dart';
import 'quizz_screen.dart';

class coursedetail extends StatefulWidget {
  const coursedetail({Key? key, required this.courseData}) : super(key: key);
  final Course courseData;
  @override
  State<coursedetail> createState() => _coursedetailState();
}

class _coursedetailState extends State<coursedetail> {
  @override
  CourseService courseService = CourseService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    widget.courseData.name,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 40.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                child: SingleChildScrollView(
                    child: Column(
                  children: [
                    Container(
                      height: 60,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.2,
                      height: MediaQuery.of(context).size.height / 6,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(81, 255, 255, 255),
                          border: Border.all(color: Colors.black)),
                      child: Text(
                        widget.courseData.courseDetail,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          Container(
                            height: 51,
                            alignment: Alignment.centerLeft,
                            child: InkWell(
                              onTap: (() {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => editPage(
                                            courseData: widget.courseData)));
                              }),
                              child: const Text(
                                "Edit",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 76, 0, 252),
                                    fontSize: 18),
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 1.59,
                          ),
                          Container(
                            height: 51,
                            alignment: Alignment.centerLeft,
                            child: InkWell(
                              onTap: (() {
                                deletedata();
                              }),
                              child: const Text(
                                "Delete",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 252, 0, 0),
                                    fontSize: 18),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height / 2.47,
                    ),
                    Container(
                        height: MediaQuery.of(context).size.height / 12,
                        alignment: Alignment.centerRight,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        alignment: Alignment.bottomRight,
                                        child: ElevatedButton(
                                          style: ButtonStyle(
                                            padding: MaterialStateProperty.all(
                                                const EdgeInsets.only(
                                                    left: 35,
                                                    right: 35,
                                                    top: 10,
                                                    bottom: 10)),
                                            shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(40.0),
                                              ),
                                            ),
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    const Color.fromARGB(
                                                        255, 247, 220, 111)),
                                          ),
                                          child: const Text("Homepage",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.black)),
                                          onPressed: (() {
                                            Navigator.pop(context);
                                          }),
                                        ),
                                      ),
                                      Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              7.5),
                                      Container(
                                        alignment: Alignment.bottomRight,
                                        child: ElevatedButton(
                                          style: ButtonStyle(
                                            padding: MaterialStateProperty.all(
                                                const EdgeInsets.only(
                                                    left: 35,
                                                    right: 35,
                                                    top: 10,
                                                    bottom: 10)),
                                            shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(40.0),
                                              ),
                                            ),
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    const Color.fromARGB(
                                                        255, 247, 220, 111)),
                                          ),
                                          child: const Text("Exercise",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.black)),
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const QuizzScreen()),
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ])),
                  ],
                )),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 1.125,
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(70.0),
                    topRight: Radius.circular(70.0),
                  ),
                ),
              ),
            ),
          ]),
    );
  }

  void deletedata() async {
    ProgressDialog.show(context);
    try {
      final updateSuccess =
          await courseService.deleteCourse(widget.courseData.id);

      if (updateSuccess) {
        ProgressDialog.dismiss(context);
        //to do
        Navigator.pop((context));
      } else {
        ProgressDialog.dismiss(context);

        // Find the Scaffold in the widget tree and use it to show a SnackBar.
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Something went wrong, please try again")));
      }
    } on Exception catch (e) {
      log("$e");
      ProgressDialog.dismiss(context);
      // Find the Scaffold in the widget tree and use it to show a SnackBar.
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }
}
