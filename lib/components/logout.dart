import 'package:flutter/material.dart';

import '../screen/login.dart';

class Logout extends StatelessWidget {
  VoidCallback? onLogoutPressed;

  Logout({
    Key? key,
    this.onLogoutPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      child: ElevatedButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(
              const EdgeInsets.only(left: 35, right: 35, top: 15, bottom: 15)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40.0),
            ),
          ),
          backgroundColor: MaterialStateProperty.all(
              const Color.fromARGB(255, 247, 220, 111)),
        ),
        child: const Text("Logout",
            style: TextStyle(fontSize: 16, color: Colors.black)),
        onPressed: () {
          onLogoutPressed?.call();
        },
      ),
    );
  }
}
