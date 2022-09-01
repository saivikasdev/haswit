import 'package:clay_containers/widgets/clay_container.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:haswit_mentor_app/constants.dart';
import 'package:haswit_mentor_app/indicator.dart';
import 'package:haswit_mentor_app/models/my_courses_data.dart';
import 'package:haswit_mentor_app/my_courses/courses_card1.dart';
import 'package:haswit_mentor_app/my_courses/new_course/new_course.dart';
import 'package:haswit_mentor_app/my_courses/recording-detail.dart';
import 'package:haswit_mentor_app/profile_page/components/my_outline_button.dart';
import 'package:haswit_mentor_app/profile_page/constantss.dart';

class My_courses extends StatefulWidget {
  const My_courses({super.key});

  @override
  State<My_courses> createState() => _My_coursesState();
}

class _My_coursesState extends State<My_courses> {
  @override
  void initState() {
    FirebaseFirestore.instance
        .collection('mentors')
        .doc('+919573604021')
        .collection('mycourses')
        .get()
        .then((QuerySnapshot querySnapshot) {
      setState(() {
        length = querySnapshot.docs.length;
      });
    });
    super.initState();

    Future.delayed(const Duration(seconds: 5), () {
      //asynchronous delay
      if (this.mounted) {
        //checks if widget is still active and not disposed
        setState(() {
          //tells the widget builder to rebuild again because ui has updated
          _visible =
              false; //update the variable declare this under your class so its accessible for both your widget build and initState which is located under widget build{}
        });
      }
    });
  }

  bool _visible = true;
  int length = 0;
  @override
  Widget build(BuildContext context) {
    List index = [1, 2, 3, 1, 2, 3, 1, 2, 3];
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    Color baseColor = Color(0xFFf2f2f2);
    double kDefaultPadding = 20;
    if (length != 0) {
      return Material(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: kDefaultPadding * 1.5),
              Row(
                children: [
                  SizedBox(
                    width: h - 100,
                  ),
                  Text('- YOUR COURSES -',
                      style: GoogleFonts.montserrat(
                          color: Colors.black, fontWeight: FontWeight.bold)),
                  SizedBox(
                    width: h / 2 + 120,
                  ),
                  MyOutlineButton(
                    imageSrc: 'assets/images/Intreaction_design.png',
                    text: "New course",
                    press: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => new_course()));
                    },
                  ),
                ],
              ),
              SizedBox(height: kDefaultPadding * 1.5),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SizedBox(
                  width: w,
                  child: Wrap(
                    alignment: WrapAlignment.spaceEvenly,
                    spacing: kDefaultPadding,
                    runSpacing: kDefaultPadding * 2,
                    children: List.generate(
                      length,
                      (inde) => InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        recor_detail(inde: inde)));
                          },
                          child: Course_card1(indx: inde, press: () {})),
                    ),
                  ),
                ),
              ),
              SizedBox(height: kDefaultPadding * 5),
            ],
          ),
        ),
      );
    } else {
      return indicator(Color.fromARGB(255, 0, 234, 255));
    }
  }
}
