import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:haswit_mentor_app/constants.dart';
import 'package:haswit_mentor_app/extensions.dart';
import 'package:haswit_mentor_app/models/my_courses_data.dart';
import 'package:haswit_mentor_app/profile_page/constantss.dart';
import 'package:websafe_svg/websafe_svg.dart';

class mentor_details extends StatelessWidget {
    const mentor_details({
    super.key,
    required this.inde,
  });
  final int inde;


  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: INDEX.sessionindex,
      builder: (context, value, child) => Padding(
        padding: EdgeInsets.symmetric(
            horizontal: kDefaultPadding, vertical: kDefaultPadding / 2),
        child: InkWell(
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.all(kDefaultPadding),
                decoration: BoxDecoration(
                  color: Color.fromARGB(95, 231, 230, 230),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "INSTRUCTOR",
                          style: GoogleFonts.lato(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Colors.black54),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                          maxRadius: 34,
                          backgroundColor: Colors.transparent,
                          backgroundImage:
                              AssetImage(course_data[inde].mentor_image),
                        ),
                        SizedBox(width: kDefaultPadding / 2),
                        Expanded(
                          child: Text.rich(
                            TextSpan(
                              text: course_data[inde].mentor_name,
                              style: GoogleFonts.lato(
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                              children: [],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                            width: kDefaultPadding +
                                kDefaultPadding +
                                kDefaultPadding +
                                kDefaultPadding),
                        Text(
                          course_data[inde].mentor_duty,
                          style: GoogleFonts.lato(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                          course_data[inde].mentor_about,
                          style: GoogleFonts.lato(
                              fontSize: 20, color: Colors.black54),
                        ),
                      ],
                    )
                  ],
                ),
              ).addNeumorphism(
                blurRadius: 15,
                borderRadius: 15,
                offset: Offset(5, 5),
                topShadowColor: Colors.white60,
                bottomShadowColor: Color(0xFF234395).withOpacity(0.15),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
