import 'package:auth_buttons/auth_buttons.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lab8_033/service/auth_service.dart';




class homepage extends StatefulWidget {
  const homepage({super.key});


  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  AuthService authService =AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("login"),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(10),
          child: GoogleAuthButton(
            onPressed: () {
              authService.signInWithGoogle().then((value) {
                print(value);
                
              },);
            },
          ),
        ),
      ),
    );
  }
}
