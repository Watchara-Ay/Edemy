import 'dart:developer';

import 'package:flutter/material.dart';

import '../data/api/models/response/course_model.dart';
import '../data/api/services/course_service.dart';
import '../ui/shared/progress_dialog.dart';

class editPage extends StatefulWidget {
  final Course courseData;
  const editPage({Key? key, required this.courseData}) : super(key: key);

  @override
  State<editPage> createState() => _editPageState();
}

class _editPageState extends State<editPage> {
  late TextEditingController courseNameController;
  late TextEditingController courseDetailController;

  @override
  void initState() {
    courseNameController = TextEditingController(text: widget.courseData.name);
    courseDetailController =
        TextEditingController(text: widget.courseData.courseDetail);
  }

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
                    'Edit course',
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
                      height: MediaQuery.of(context).size.height / 14,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(81, 255, 255, 255),
                          border: Border.all(color: Colors.black)),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Course new name',
                          border: InputBorder.none,
                        ),
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (email) {},
                        controller: courseNameController,
                      ),
                    ),
                    Container(
                      height: 10,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.2,
                      height: MediaQuery.of(context).size.height / 6,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(81, 255, 255, 255),
                          border: Border.all(color: Colors.black)),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'New course detail',
                          border: InputBorder.none,
                        ),
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (email) {},
                        controller: courseDetailController,
                      ),
                    ),
                    // Container(
                    //   width: MediaQuery.of(context).size.width / 1.2,
                    //   height: MediaQuery.of(context).size.height / 6,
                    //   decoration: BoxDecoration(
                    //       color: const Color.fromARGB(81, 255, 255, 255),
                    //       border: Border.all(color: Colors.black)),
                    //   child: Text(
                    //     courseData.courseDetail,
                    //     style: TextStyle(
                    //       color: Colors.black,
                    //       fontSize: 18.0,
                    //       fontWeight: FontWeight.w700,
                    //     ),
                    //   ),
                    // ),
                    Container(
                      child: Row(
                        children: [
                          Container(
                            height: 51,
                            alignment: Alignment.centerLeft,
                            child: InkWell(
                              onTap: (() {
                                updateData();
                              }),
                              child: const Text(
                                "Done",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 76, 0, 252),
                                    fontSize: 18),
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 1.7,
                          ),
                          Container(
                            height: 51,
                            alignment: Alignment.centerLeft,
                            child: InkWell(
                              onTap: (() {
                                Navigator.pop(context);
                              }),
                              child: const Text(
                                "Cancel",
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

  void updateData() async {
    ProgressDialog.show(context);
    try {
      final updateSuccess = await courseService.updateCourse(
          widget.courseData.id,
          courseNameController.text,
          courseDetailController.text);

      if (updateSuccess) {
        ProgressDialog.dismiss(context);
        //to do
        Navigator.pop((context));
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
