import 'package:edgroup/screen/homepage.dart';
import 'package:edgroup/screen/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Registerpage extends StatelessWidget {
  const Registerpage({Key? key}) : super(key: key);

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
                'Register Page',
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
                      hintText: 'Username',
                      border: InputBorder.none,
                    ),
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (email) {},
                  ),
                ),
                Container(
                  height: 24,
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
                      hintText: 'Email',
                      border: InputBorder.none,
                    ),
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (email) {},
                  ),
                ),
                Container(
                  height: 24,
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
                      hintText: 'Password',
                      border: InputBorder.none,
                    ),
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (email) {},
                  ),
                ),
                Container(
                  height: 24,
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
                      hintText: 'Repassword',
                      border: InputBorder.none,
                    ),
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (email) {},
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()),
                          );
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
}
