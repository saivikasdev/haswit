import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constantss.dart';

class AboutTextWithSign extends StatelessWidget {
  const AboutTextWithSign({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OverlayEntry entry;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "About \nme :",
          style: GoogleFonts.lato(
              fontSize: 60, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        SizedBox(height: kDefaultPadding * 2),
      ],
    );
  }
}
