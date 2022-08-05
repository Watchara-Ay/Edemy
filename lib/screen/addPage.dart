import 'dart:developer';

import 'package:flutter/material.dart';

import '../data/api/services/course_service.dart';
import '../ui/shared/progress_dialog.dart';

class addPage extends StatefulWidget {
  const addPage({Key? key}) : super(key: key);

  @override
  State<addPage> createState() => _addPageState();
}

class _addPageState extends State<addPage> {
  CourseService courseService = CourseService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: <
          Widget>[
        Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const <Widget>[
              Text(
                'Add course',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 50.0,
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
                  padding: EdgeInsets.all(10),
                  height: MediaQuery.of(context).size.height / 15,
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(217, 217, 217, 100),
                      border: Border.all(width: 1),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20))),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Course name',
                      border: InputBorder.none,
                    ),
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (email) {},
                    controller: courseNameController,
                  ),
                ),
                Container(
                  height: 24,
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  height: MediaQuery.of(context).size.height / 6,
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(217, 217, 217, 100),
                      border: Border.all(width: 1),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20))),
                  child: TextFormField(
                    maxLines: null,
                    decoration: const InputDecoration(
                      hintText: 'Course infomation',
                      border: InputBorder.none,
                    ),
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (email) {},
                    controller: courseDetailController,
                  ),
                ),
                Container(
                  height: 24,
                ),
                Row(
                  children: [
                    Container(
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
                    Container(
                      width: MediaQuery.of(context).size.width / 2.7,
                    ),
                    Container(
                      alignment: Alignment.centerRight,
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
                        child: const Text("Confirm",
                            style:
                                TextStyle(fontSize: 16, color: Colors.black)),
                        onPressed: () {
                          addCourse();
                        },
                      ),
                    ),
                  ],
                ),
              ],
            )),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 1.145,
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

  final courseNameController = TextEditingController();
  final courseDetailController = TextEditingController();

  void addCourse() async {
    ProgressDialog.show(context);
    try {
      final updateSuccess = await courseService.addCourse(
          courseNameController.text, courseDetailController.text);

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
