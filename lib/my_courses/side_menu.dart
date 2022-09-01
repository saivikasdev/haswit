import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:haswit_mentor_app/my_courses/tags.dart';
import 'package:haswit_mentor_app/profile_page/constantss.dart';
import 'package:haswit_mentor_app/responsive.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../constants.dart';
import '../extensions.dart';

import 'package:flutter/foundation.dart' show kIsWeb;

class SideMenu extends StatelessWidget {
 const SideMenu({super.key, required this.inde,});
  final int inde;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        height: double.infinity,
        padding: EdgeInsets.only(top: kIsWeb ? kDefaultPadding : 0),
        color: kBgLightColor,
        child: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "HASWIT",
                      style: GoogleFonts.lato(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black38),
                    ),

                    // We don't want to show this close button on Desktop mood
                    if (!Responsive.isDesktop(context)) CloseButton(),
                  ],
                ),

                SizedBox(height: kDefaultPadding * 2),
                // Tags
                Tags(inde:inde),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
