import 'package:clay_containers/clay_containers.dart';
import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:haswit_mentor_app/models/my_courses_data.dart';

class Course_card extends StatefulWidget {
  const Course_card({super.key, required this.indx, required this.press});
  final int indx;
  final Function press;

  @override
  State<Course_card> createState() => _Course_cardState();
}

class _Course_cardState extends State<Course_card> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    Color baseColor = Color(0xFFf2f2f2);
    return ClayContainer(
      color: baseColor,
      height: h / 3 + 100,
      width: h / 3 + 100,
      borderRadius: 75,
      curveType: CurveType.concave,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onHover: (value) {
              setState(() {
                isHover = value;
              });
            },
            child: Container(
                padding: EdgeInsets.all(20 * 1.5),
                height: 120,
                width: 120,
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
          ),
          SizedBox(height: 40),
          Text(
            course_data[widget.indx].name,
            style: GoogleFonts.lato(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.black54),
          ),
        ],
      ),
    );
  }
}
