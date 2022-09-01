import 'package:flutter/material.dart';
import 'package:haswit_mentor_app/models/my_courses_data.dart';
import 'package:haswit_mentor_app/my_courses/records_details/rec_card.dart';
import 'package:haswit_mentor_app/my_courses/session_card.dart';
import 'package:haswit_mentor_app/profile_page/constantss.dart';
import 'package:haswit_mentor_app/responsive.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../../../constants.dart';

import 'package:flutter/foundation.dart' show kIsWeb;

class list_of_rec extends StatefulWidget {
const list_of_rec({super.key, required this.inde,});
  final int inde;

  @override
  _list_of_recState createState() => _list_of_recState();
}

class _list_of_recState extends State<list_of_rec> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    int index;
    return Scaffold(
      key: _scaffoldKey,
      // drawer: ConstrainedBox(
      //   constraints: BoxConstraints(maxWidth: 250),
      //   child: SideMenu(),
      // ),
      body: Container(
        padding: EdgeInsets.only(top: kIsWeb ? kDefaultPadding : 0),
        color: kBgDarkColor,
        child: SafeArea(
          right: false,
          child: Column(
            children: [
          
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: Row(
                  children: [
                    SizedBox(width: 15),
                    Text(
                      "Sessions",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    Spacer(),
                    CircleAvatar(
              maxRadius: 15,
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage(course_data[widget.inde].icon
              ),
            ),
                  ],
                ),
              ),
              SizedBox(height: kDefaultPadding),
              Expanded(
                child: ListView.builder(
                  itemCount: course_data[widget.inde].record.length,
                  itemBuilder: (context, indx) => Column(
                    children: [
                      rec_card(
                        index: indx,
                        email: course_data[widget.inde],
                        press: () {
                          INDEX.sessionindex.value = indx;
                          print(INDEX.sessionindex.value);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
