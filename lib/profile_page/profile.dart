import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:haswit_mentor_app/indicator.dart';
import 'package:haswit_mentor_app/profile_page/sections/about/about_section.dart';
import 'package:haswit_mentor_app/profile_page/sections/contact/contact_section.dart';
import 'package:haswit_mentor_app/profile_page/sections/feedback/feedback_section.dart';
import 'package:haswit_mentor_app/profile_page/sections/service/service_section.dart';
import 'package:haswit_mentor_app/profile_page/sections/topSection/top_section.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

import 'constantss.dart';

class profilepage extends StatefulWidget {
  @override
  State<profilepage> createState() => _profilepageState();
}

class _profilepageState extends State<profilepage> {
  @override
  void initState() {
    Future<Set<void>> Data = FirebaseFirestore.instance
        .collection('mentors')
        .doc('+917702795038')
        .get()
        .then((doc) => {
              setState(() {
                data = doc.data();
              })
            });
    super.initState();
  }

  var data;
  @override
  Widget build(BuildContext context) {
    if (data != null) {
      return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              TopSection(),
              SizedBox(height: kDefaultPadding * 2),
              AboutSection(),
              // ServiceSection(),
              SizedBox(height: kDefaultPadding),
              ContactSection(),
              // This SizeBox just for demo
              // SizedBox(
              //   height: 500,
              // )
            ],
          ),
        ),
      );
    } else {
      return indicator(Color.fromARGB(255, 255, 0, 179));
    }
  }

 
}
