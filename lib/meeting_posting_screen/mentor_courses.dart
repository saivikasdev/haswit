// ignore_for_file: prefer_const_constructors

import 'package:clay_containers/clay_containers.dart';
import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:haswit_mentor_app/constants.dart';
import 'package:haswit_mentor_app/meeting_posting_screen/course_card.dart';
import 'package:haswit_mentor_app/models/my_courses_data.dart';

class Mentor_courses extends StatefulWidget {
  const Mentor_courses({super.key});

  @override
  State<Mentor_courses> createState() => _Mentor_coursesState();
}

class _Mentor_coursesState extends State<Mentor_courses> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    List index = [1, 2, 3, 1, 2, 3, 1, 2, 3];
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    Color baseColor = Color(0xFFf2f2f2);
    double kDefaultPadding = 20;
    return Container(
        // ignore: sort_child_properties_last
        child: Column(
          children: [
            SizedBox(
              height: h / 12,
            ),
            Row(
              children: [
                SizedBox(
                  width: h / 20,
                ),
                Text(
                  "Your Courses",
                  style: GoogleFonts.lato(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black45),
                ),
              ],
            ),
            SizedBox(
              height: h / 12,
            ),
            Column(
              children: [
                SizedBox(height: kDefaultPadding * 1.5),
                SizedBox(
                  width: w,
                  child: Wrap(
                    alignment: WrapAlignment.spaceEvenly,
                    spacing: kDefaultPadding,
                    runSpacing: kDefaultPadding * 2,
                    children: List.generate(
                      course_data.length,
                      (inde) => InkWell(
                          onTap: () {
                            INDEX.courseindex.value = inde;
                            print(INDEX.courseindex);
                          },
                          child: Course_card(indx: inde, press: () {})),
                    ),
                  ),
                ),
                SizedBox(height: kDefaultPadding * 5),
              ],
            ),
            SizedBox(
              height: h / 2,
            ),
          ],
        ),
        color: baseColor);
  }
}







    // ClayContainer(
                //   color: baseColor,
                //   height: h / 2,
                //   width: h / 2,
                //   borderRadius: 75,
                //   curveType: CurveType.none,
                //   child: ,
                // ),
                // SizedBox(width: 50),
                // ClayContainer(
                //   color: baseColor,
                //   height: h / 2,
                //   width: h / 2,
                //   borderRadius: 75,
                //   curveType: CurveType.convex,
                // ),