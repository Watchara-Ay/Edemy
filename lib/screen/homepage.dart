import 'package:edgroup/components/logout.dart';
import 'package:edgroup/screen/login.dart';
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
                      "Hi",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Container(
                    color: Color.fromARGB(255, 255, 0, 0),
                    width: MediaQuery.of(context).size.width / 3,
                    height: MediaQuery.of(context).size.height / 7,
                    alignment: Alignment.topLeft,
                  ),
                ],
              ),
              Categories(),
              Container(
                child: SingleChildScrollView(
                    child: Column(
                  children: [
                    Container(
                      height: 30,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.3,
                      height: MediaQuery.of(context).size.height / 13,
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
                              Color.fromARGB(255, 0, 255, 204)),
                        ),
                        child: const Text("Register",
                            style:
                                TextStyle(fontSize: 16, color: Colors.black)),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const homepage()),
                          );
                        },
                      ),
                    ),
                    Container(
                      height: 24,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.3,
                      height: MediaQuery.of(context).size.height / 13,
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
                              Color.fromARGB(255, 0, 255, 204)),
                        ),
                        child: const Text("Register",
                            style:
                                TextStyle(fontSize: 16, color: Colors.black)),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const homepage()),
                          );
                        },
                      ),
                    ),
                    Container(
                      height: 24,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.3,
                      height: MediaQuery.of(context).size.height / 13,
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
                              Color.fromARGB(255, 0, 255, 204)),
                        ),
                        child: const Text("Register",
                            style:
                                TextStyle(fontSize: 16, color: Colors.black)),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const homepage()),
                          );
                        },
                      ),
                    ),
                    Container(
                      height: 24,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.3,
                      height: MediaQuery.of(context).size.height / 13,
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
                              Color.fromARGB(255, 0, 255, 204)),
                        ),
                        child: const Text("Register",
                            style:
                                TextStyle(fontSize: 16, color: Colors.black)),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const homepage()),
                          );
                        },
                      ),
                    ),
                  ],
                )),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 1.5 + 10,
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 218, 255, 233),
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
}
