import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lab8_033/pages/home.dart';
import 'package:lab8_033/pages/mainfood.dart';
import 'package:lab8_033/service/auth_service.dart';

class Secondpage extends StatefulWidget {
  const Secondpage({super.key});

  @override
  State<Secondpage> createState() => _SecondpageState();
}

class _SecondpageState extends State<Secondpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Profile"), actions: [
          ]
        ),
        body: Center(
          child: Column(
            children: [
              Image.network(FirebaseAuth.instance.currentUser!.photoURL!),
              Text(FirebaseAuth.instance.currentUser!.displayName!),
              Text(FirebaseAuth.instance.currentUser!.email!),
              Text(FirebaseAuth.instance.currentUser!.metadata.lastSignInTime!
                  .toIso8601String()),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => mainfood(),
                        ));
                  },
                  child: Text(" GO TO MAIN FOODs"))
            ],
          ),
        ));
  }
}
