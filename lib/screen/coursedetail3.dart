import 'package:flutter/material.dart';

import 'homepage.dart';
import 'login.dart';

class coursedetail3 extends StatelessWidget {
  const coursedetail3({Key? key}) : super(key: key);

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
                'Multiply',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 40.0,
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
                  "* call Multiply mean to increase in number especially greatly"
                  " In Example 10 * 2 = 20, 41 * 5 = 205",
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
                alignment: Alignment.bottomRight,
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
                  child: const Text("Exercise",
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
                height: MediaQuery.of(context).size.height / 2,
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
                    "Homepage",
                    style: TextStyle(
                        color: Color.fromARGB(255, 252, 0, 0), fontSize: 18),
                  ),
                ),
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
      ]),
    );
  }
}
