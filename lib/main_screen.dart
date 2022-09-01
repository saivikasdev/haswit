import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:haswit_mentor_app/details%20data/detailsscreen.dart';
import 'package:haswit_mentor_app/login%20data/loginscreen1.dart';
import 'package:haswit_mentor_app/meeting_posting_screen/meenting_posting.dart';
import 'package:haswit_mentor_app/menu.dart';

class Main_screen extends StatefulWidget {
  const Main_screen({super.key});

  @override
  State<Main_screen> createState() => _Main_screenState();
}

class _Main_screenState extends State<Main_screen> {
  @override
  Widget build(BuildContext context) {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final User? user = _auth.currentUser;
    var phone = user?.phoneNumber;
    // if (phone != null) {
    //   print('$phone-----');
    //   return Meeting_posting();
    // } else
    //   return loginscreen();
    return Meeting_posting();
  }
}
