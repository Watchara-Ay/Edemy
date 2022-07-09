import 'package:flutter/material.dart';

import 'homepage.dart';
import 'login.dart';

class coursedetail extends StatelessWidget {
  const coursedetail({Key? key}) : super(key: key);

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
                'Plus and minus',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 50.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
        Container(
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
                    color: Color.fromARGB(81, 255, 255, 255),
                    border: Border.all(color: Colors.black)),
                child: const Text(
                  "+ call plus mean by the addition of or increased by"
                  " In Example 10 + 2 = 12",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Container(
                height: 24,
              ),
              Container(
                alignment: Alignment.centerRight,
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
                        const Color.fromARGB(255, 247, 220, 111)),
                  ),
                  child: const Text("Exam",
                      style: TextStyle(fontSize: 16, color: Colors.black)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const homepage()),
                    );
                  },
                ),
              ),
              Container(
                height: 200,
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: InkWell(
                  onTap: (() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => homepage()),
                    );
                  }),
                  child: const Text(
                    "Cancel",
                    style: TextStyle(
                        color: Color.fromARGB(255, 252, 0, 0), fontSize: 18),
                  ),
                ),
              ),
            ],
          )),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 1.15,
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(70.0),
              topRight: Radius.circular(70.0),
            ),
          ),
        ),
      ]),
      // body: Column(
      //   crossAxisAlignment: CrossAxisAlignment.start,
      //   children: [
      //     Container(
      //       padding: const EdgeInsets.all(20.0),
      //       child: Column(
      //         crossAxisAlignment: CrossAxisAlignment.center,
      //         children: const <Widget>[
      //           Text(
      //             'Register Page',
      //             style: TextStyle(
      //               color: Colors.black,
      //               fontSize: 50.0,
      //               fontWeight: FontWeight.w700,
      //             ),
      //           ),
      //         ],
      //       ),
      //     ),
      //     Container(
      //       margin: const EdgeInsets.all(10.0),
      //       padding: EdgeInsets.all(20),
      //       width: MediaQuery.of(context).size.width,
      //       height: MediaQuery.of(context).size.height / 5,
      //       alignment: Alignment.topLeft,
      //       decoration: BoxDecoration(
      //           color: Color.fromARGB(81, 255, 255, 255),
      //           border: Border.all(color: Colors.blueAccent)),
      //       child: const Text(
      //         "Hi everyone in this session we will teach about plus and minus",
      //         style: TextStyle(
      //           color: Colors.black,
      //           fontSize: 24.0,
      //           fontWeight: FontWeight.w700,
      //         ),
      //       ),
      //     ),
      //     Column(
      //       children: [
      //         Container(
      //           margin: const EdgeInsets.all(10),
      //           padding: EdgeInsets.all(20),
      //           width: MediaQuery.of(context).size.width / 2,
      //           height: MediaQuery.of(context).size.height / 6,
      //           alignment: Alignment.topLeft,
      //           decoration: BoxDecoration(
      //               color: Color.fromARGB(81, 255, 255, 255),
      //               border: Border.all(color: Colors.blueAccent)),
      // child: const Text(
      //   "+ call plus mean by the addition of or increased by"
      //   " In Example 10 + 2 = 12",
      //   style: TextStyle(
      //     color: Colors.black,
      //     fontSize: 18.0,
      //     fontWeight: FontWeight.w700,
      //   ),
      // ),
      //         ),
      //         Container(
      //           margin: const EdgeInsets.all(10),
      //           padding: EdgeInsets.all(20),
      //           width: MediaQuery.of(context).size.width / 2,
      //           height: MediaQuery.of(context).size.height / 6,
      //           alignment: Alignment.topLeft,
      //           decoration: BoxDecoration(
      //               color: Color.fromARGB(81, 255, 255, 255),
      //               border: Border.all(color: Colors.blueAccent)),
      //           child: const Text(
      //             "- call minus mean subtraction of"
      //             " In Example 10 - 2 = 8",
      //             style: TextStyle(
      //               color: Colors.black,
      //               fontSize: 18.0,
      //               fontWeight: FontWeight.w700,
      //             ),
      //           ),
      //         ),
      //       ],
      //     ),
      //   ],
      // ),
    );
  }
}
