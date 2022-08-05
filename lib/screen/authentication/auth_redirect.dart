import 'package:edgroup/data/api/services/auth_service.dart';
import 'package:edgroup/screen/homepage.dart';
import 'package:edgroup/screen/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class AuthRedirectScreen extends StatefulWidget {
  const AuthRedirectScreen({Key? key}) : super(key: key);

  @override
  State<AuthRedirectScreen> createState() => _AuthRedirectScreenState();
}

class _AuthRedirectScreenState extends State<AuthRedirectScreen> {

  var authService = AuthService();

  @override
  void initState() {
    super.initState();

    _redirect();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: const [
            CircularProgressIndicator(
              color: Colors.black38,
            ),
          ],
        ),
      )
    );
  }

  void _redirect() async {
    await Future.delayed(const Duration(milliseconds: 1000));

    bool isLoggedIn = await authService.isLoggedIn();

    if (isLoggedIn) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const homepage())
      );
    }
    else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage())
      );
    }
  }
}