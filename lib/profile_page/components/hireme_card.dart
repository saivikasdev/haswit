import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constantss.dart';
import 'default_button.dart';

class HireMeCard extends StatelessWidget {
  const HireMeCard({
    Key?key,
    required this.text,
    required this.icon,
    required this.color,
  }) : super(key: key);
  final String text;
  final String icon;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      // padding: EdgeInsets.all(kDefaultPadding * 2),
      constraints: BoxConstraints(maxWidth: 310),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 50),
            blurRadius: 50,
            color: color.withOpacity(0.10),
          )
        ],
      ),
      child: Row(
        children: [
          SizedBox(
            width: 30,
          ),
          Image.asset(icon, height: 20, width: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: SizedBox(
              height: 30,
              child: VerticalDivider(),
            ),
          ),
          Text(
            text,
            overflow: TextOverflow.visible,
            style: GoogleFonts.lato(
                fontSize: 17, color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
