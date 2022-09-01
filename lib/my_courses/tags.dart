import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:haswit_mentor_app/models/my_courses_data.dart';
import 'package:haswit_mentor_app/profile_page/constantss.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../constants.dart';

class Tags extends StatefulWidget {
 const Tags({super.key, required this.inde,});
  final int inde;
  @override
  State<Tags> createState() => _TagsState();
}

List<bool> selected = [true, false, false, false];

class _TagsState extends State<Tags> {
  List<List> icon = [
    ["assets/Icons/Markup.svg", "Description"],
    ["assets/Icons/chat.svg", "Discussion"],
    ["assets/Icons/github.svg", "Resources"],
    ["assets/Icons/man.svg", "Instructor"],
  ];

  void select(int n) {
    for (int i = 0; i < 4; i++) {
      if (i == n) {
        selected[i] = true;
      } else {
        selected[i] = false;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Color color = Color.fromARGB(255, 168, 168, 168);

    return Column(
      children: [
        Row(
          children: [
            WebsafeSvg.asset("assets/Icons/Angle down.svg", width: 16),
            SizedBox(width: kDefaultPadding / 4),
            CircleAvatar(
              maxRadius: 15,
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage(course_data[widget.inde].icon
              ),
            ),
            SizedBox(width: kDefaultPadding / 2),
            InkWell(
              onTap: () => print("object"),     
              child: Text(
                course_data[widget.inde].name,
                style: Theme.of(context)
                    .textTheme
                    .button!
                    .copyWith(color: kGrayColor),
              ),
            ),
            Spacer(),
            MaterialButton(
              padding: EdgeInsets.all(10),
              minWidth: 40,
              onPressed: () {},
              child: CircleAvatar(
                maxRadius: 24,
                backgroundColor: Colors.transparent,
                backgroundImage: AssetImage(course_data[widget.inde].mentor_image),
              ),
            )
          ],
        ),
        SizedBox(height: kDefaultPadding / 2),
        Row(
          children: [
            Column(
              children: icon
                  .map(
                    (e) => buildTag(
                      context,
                      selected: selected[icon.indexOf(e)],
                      e: e,
                      onTap: () {
                        setState(() {
                          select(icon.indexOf(e));
                        });
                        INDEX.index.value = icon.indexOf(e);
                        print(INDEX.index.value);
                        // print(e);
                        // print(icon.indexOf(e));
                      },
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ],
    );
  }

  InkWell buildTag(
    BuildContext context, {
    required List<dynamic> e,
    required Function onTap,
    required bool selected,
  }) {
    return InkWell(
      onTap: () {
        setState(() {
          select(icon.indexOf(e));
        });
        INDEX.index.value = icon.indexOf(e);
        print(INDEX.index.value);
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(kDefaultPadding * 1.5, 10, 0, 10),
        child: Row(
          children: [
            WebsafeSvg.asset(
              e[0], height: 20,
              color:
                  selected ? Colors.black : Color.fromARGB(255, 167, 166, 166),
              // color: color
            ),
            SizedBox(
              width: 6,
            ),
            InkWell(
              child: Text(
                e[1],
                style: GoogleFonts.lato(
                  fontSize: 15,
                  color: selected
                      ? Colors.black
                      : Color.fromARGB(255, 167, 166, 166),
                ),
              ),
            ),
            SizedBox(width: kDefaultPadding / 2),
          ],
        ),
      ),
    );
  }
}
