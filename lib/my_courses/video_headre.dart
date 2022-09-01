import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:haswit_mentor_app/models/my_courses_data.dart';
import 'package:haswit_mentor_app/profile_page/constantss.dart';
import 'package:haswit_mentor_app/responsive.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../../../constants.dart';

class Header extends StatelessWidget {
   const Header({
    super.key,
    required this.inde,
  });
  final int inde;


  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: INDEX.sessionindex,
      builder: (context, value, child) => Padding(
        padding: EdgeInsets.all(kDefaultPadding),
        child: Row(
          children: [
            // We need this back button on mobile only
            if (Responsive.isMobile(context)) BackButton(),
            Text(
              "My courses",
              style: GoogleFonts.lato(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black38),
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              "/",
              style: GoogleFonts.lato(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black38),
            ),
            SizedBox(
              width: 5,
            ),

            Text(
              course_data[inde].name,
              style: GoogleFonts.lato(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black38),
            ),
            SizedBox(
              width: 5,
            ),

            Text(
              "/",
              style: GoogleFonts.lato(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black38),
            ),
            SizedBox(
              width: 5,
            ),

            Text(
              course_data[inde].record[value]['title'],
              style: GoogleFonts.lato(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(96, 0, 0, 0)),
            ),

            Spacer(),
            if (Responsive.isDesktop(context))
             
            IconButton(
              icon: WebsafeSvg.asset(
                "assets/Icons/forward.svg",
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
