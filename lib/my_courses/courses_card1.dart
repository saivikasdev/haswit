import 'package:clay_containers/clay_containers.dart';
import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:haswit_mentor_app/models/my_courses_data.dart';
import 'package:haswit_mentor_app/my_courses/course_details_cont.dart';
import 'package:haswit_mentor_app/my_courses/list_of_ses.dart';
import 'package:haswit_mentor_app/my_courses/list_of_users.dart';

class Course_card1 extends StatefulWidget {
  const Course_card1({super.key, required this.indx, required this.press});
  final int indx;
  final Function press;

  @override
  State<Course_card1> createState() => _Course_card1State();
}

class _Course_card1State extends State<Course_card1> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    Color baseColor = Color(0xFFf2f2f2);
    return ClayContainer(
      curveType: CurveType.convex,
      emboss: true,
      customBorderRadius: BorderRadius.only(
        topRight: Radius.circular(100),
        bottomLeft: Radius.circular(100),
        topLeft: Radius.circular(50),
        bottomRight: Radius.circular(100),
      ),
      color: baseColor,
      height: h - 200,
      width: h + h / 2 + h / 5 + h / 8,
      child: Row(
        children: [
          // Once our width is less then 1300 then it start showing errors
          // Now there is no error if our width is less then 1340
          Expanded(
            flex: _size.width > 1340 ? 3 : 2,
            child: course_details(
              indx: widget.indx,
              press: widget.press,
            ),
          ),
          Expanded(flex: _size.width > 1340 ? 5 : 4, child: list_of_ses(inde: widget.indx,)),
          Expanded(
            flex: _size.width > 1340 ? 3 : 4,
            child: list_of_users(inde: widget.indx,),
          ),
        ],
      ),
    );
  }
}
