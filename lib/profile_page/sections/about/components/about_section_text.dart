import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constantss.dart';

class AboutSectionText extends StatelessWidget {
  const AboutSectionText({
    Key?key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Text(
        text,
        style: GoogleFonts.lato(fontSize: 17, color: Colors.black45),
      ),
    );
  }
}
