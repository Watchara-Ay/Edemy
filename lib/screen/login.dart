import 'dart:developer';

import 'package:edgroup/data/api/services/auth_service.dart';
import 'package:edgroup/screen/homepage.dart';
import 'package:edgroup/screen/register.dart';
import 'package:edgroup/ui/shared/progress_dialog.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final authService = AuthService();

  // Text Controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  // States
  bool isLoading = false;

  @override
  void dispose() {
    super.dispose();

    usernameController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.fromLTRB(30, 130, 30, 48),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
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
                  controller: usernameController,
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
                  controller: passwordController,
                  decoration: const InputDecoration(
                    hintText: 'Password',
                    border: InputBorder.none,
                  ),
                  obscureText: true,
                  onChanged: (password) {},
                  onTap: () {
                    selectAll(passwordController);
                  },
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
                    login();
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

  void login() async {
    setState(() {
      isLoading = true;
    });

    ProgressDialog.show(context);

    // retrieve data from textfields
    final String username = usernameController.text;
    final String password = passwordController.text;

    try {
      final loginSuccess = await authService.login(username, password);

      if (loginSuccess) {
        // close the login screen & go to home
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const homepage()));
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

    setState(() {
      isLoading = false;
    });
  }

  void selectAll(TextEditingController controller) {
    controller.selection = TextSelection(
      baseOffset: 0,
      extentOffset: controller.text.length,
    );
  }
}
