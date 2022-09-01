import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:haswit_mentor_app/indicator.dart';
import 'package:haswit_mentor_app/models/my_courses_data.dart';
import 'package:haswit_mentor_app/my_courses/no.of_card.dart';
import 'package:haswit_mentor_app/my_courses/outline_button1.dart';
import 'package:haswit_mentor_app/profile_page/components/my_outline_button.dart';
import 'package:haswit_mentor_app/profile_page/sections/about/components/experience_card.dart';

class course_details extends StatefulWidget {
  final int indx;
  final Function press;
  const course_details({super.key, required this.indx, required this.press});

  @override
  State<course_details> createState() => _course_detailsState();
}

class _course_detailsState extends State<course_details> {
  void initState() {
    FirebaseFirestore.instance
        .collection('mentors')
        .doc('+919573604021')
        .collection('mycourses')
        .doc('python')
        .collection('records')
        .get()
        .then((QuerySnapshot querySnapshot) {
      setState(() {
        rec_length = querySnapshot.docs.length;
      });
    });
    FirebaseFirestore.instance
        .collection('mentors')
        .doc('+919573604021')
        .collection('mycourses')
        .doc('flutter')
        .collection('users')
        .get()
        .then((QuerySnapshot querySnapshot) {
      setState(() {
        users_length = querySnapshot.docs.length;
      });
    });
    super.initState();
  }

  late int rec_length;

  late int users_length;
  @override
  Widget build(BuildContext context) {
    var mycourses = FirebaseFirestore.instance
        .collection('mentors')
        .doc('+919573604021')
        .collection('mycourses')
        .snapshots();

    bool isHover = false;
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    Color baseColor = Color(0xFFf2f2f2);
    if (mycourses != null) {
      return StreamBuilder(
        stream: mycourses,
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          if (streamSnapshot.connectionState == ConnectionState.waiting) {
            return indicator(Color.fromARGB(96, 195, 255, 0));
          } else {
            return Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "live session time : ${streamSnapshot.data!.docs[widget.indx]['livetime']}",
                    style: GoogleFonts.lato(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54),
                  ),
                  Container(
                      padding: EdgeInsets.all(20 * 1.5),
                      height: 220,
                      width: 220,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          if (!isHover)
                            BoxShadow(
                              offset: Offset(0, 20),
                              blurRadius: 30,
                              color: Colors.black.withOpacity(0.1),
                            ),
                        ],
                      ),
                      child: Image.asset(
                        course_data[widget.indx].icon,
                      )),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    streamSnapshot.data!.docs[widget.indx]['course name'],
                    style: GoogleFonts.lato(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: h / 3,
                    child: Text(
                      streamSnapshot.data!.docs[widget.indx]['description'],
                      style: GoogleFonts.lato(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black38),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 50,
                      ),
                      No_of_card(
                        numOfExp: rec_length,
                        text: 'students',
                      ),
                      No_of_card(
                        numOfExp: users_length,
                        text: 'sessions',
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  MyOutlineButton1(
                      imageSrc: 'assets/images/desktop.png',
                      text: "Edit course",
                      index: widget.indx,
                      press: () {}),
                ],
              ),
            );
          }
        },
      );
    } else {
      return indicator(Color.fromARGB(255, 144, 0, 255));
    }
  }
}
