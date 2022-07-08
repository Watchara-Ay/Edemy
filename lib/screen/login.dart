import 'package:edgroup/screen/homepage.dart';
import 'package:edgroup/screen/register.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 130, 30, 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Image.asset("assets/images/academy.png"),
              ),
              Container(
                padding: EdgeInsets.all(10),
                height: MediaQuery.of(context).size.height / 15,
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(217, 217, 217, 100),
                    border: Border.all(width: 1),
                    borderRadius: const BorderRadius.all(Radius.circular(20))),
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Username',
                    border: InputBorder.none,
                  ),
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (email) {},
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.all(10),
                height: MediaQuery.of(context).size.height / 15,
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(217, 217, 217, 100),
                    border: Border.all(width: 1),
                    borderRadius: const BorderRadius.all(Radius.circular(20))),
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Password',
                    border: InputBorder.none,
                  ),
                  obscureText: true,
                  onChanged: (password) {},
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.center,
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
                  child: const Text("Login",
                      style: TextStyle(fontSize: 16, color: Colors.black)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const homepage()),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                  alignment: Alignment.center,
                  child: Row(children: [
                    Row(
                      children: [
                        const Text(
                          "Don’t have account?",
                          style: TextStyle(fontSize: 18),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        InkWell(
                          onTap: (() {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Registerpage()),
                            );
                          }),
                          child: const Text(
                            "Create account",
                            style: TextStyle(
                                color: Color.fromARGB(255, 252, 0, 0),
                                fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                  ])),
            ],
          ),
        ),
      ),
    );
  }
}
