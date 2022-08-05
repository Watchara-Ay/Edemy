import 'package:flutter/material.dart';

class ProgressDialog {
  static void show(BuildContext context) {
    var alert = AlertDialog(
      content: Theme(
        data: ThemeData.dark(),
        child: Row(
          children: [
            const CircularProgressIndicator(),
            Container(
              margin: const EdgeInsets.only(left: 16),
              child: const Text("Loading..." ),
            ),
          ],
        ),
      ),
    );

    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  static void dismiss(BuildContext context) {
    Navigator.of(context, rootNavigator: true)
      .pop();
  }
}