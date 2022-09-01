import 'package:flutter/material.dart';
import 'package:haswit_mentor_app/models/my_courses_data.dart';
import 'package:haswit_mentor_app/my_courses/user_card.dart';
import 'package:haswit_mentor_app/profile_page/constantss.dart';
import 'package:haswit_mentor_app/responsive.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../../../constants.dart';

import 'package:flutter/foundation.dart' show kIsWeb;

class list_of_users extends StatefulWidget {
  // Press "Command + ."
    const list_of_users({
    super.key,
    required this.inde,
  });
  final int inde;


  @override
  _list_of_usersState createState() => _list_of_usersState();
}

class _list_of_usersState extends State<list_of_users> {
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
        color: Color.fromARGB(255, 173, 211, 255),
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
                      "Students",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    Spacer(),
                    MaterialButton(
                      minWidth: 20,
                      onPressed: () {},
                      child: WebsafeSvg.asset(
                        "assets/Icons/flutter.svg",
                        width: 16,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: kDefaultPadding),
              Expanded(
                child: ListView.builder(
                  itemCount: course_data[widget.inde].users.length,
                  itemBuilder: (context, indx) => Column(
                    children: [
                      user_card(
                        index: indx,
                        email: course_data[widget.inde],
                        press: () {
                          INDEX.userindex.value = indx;
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
