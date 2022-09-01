import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:haswit_mentor_app/indicator.dart';
import 'package:haswit_mentor_app/models/my_courses_data.dart';
import 'package:haswit_mentor_app/my_courses/my_courses.dart';
import 'package:haswit_mentor_app/my_courses/session_card.dart';
import 'package:haswit_mentor_app/profile_page/constantss.dart';
import 'package:haswit_mentor_app/responsive.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../../../constants.dart';

import 'package:flutter/foundation.dart' show kIsWeb;

class list_of_ses extends StatefulWidget {
  // Press "Command + ."
  const list_of_ses({
    super.key,
    required this.inde,
  });
  final int inde;

  @override
  _list_of_sesState createState() => _list_of_sesState();
}

class _list_of_sesState extends State<list_of_ses> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  var mycourses = FirebaseFirestore.instance
      .collection('mentors')
      .doc('+919573604021')
      .collection('mycourses')
      .snapshots();

  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
      .collection('mentors')
      .doc('+919573604021')
      .collection('mycourses')
      .doc('flutter')
      .collection('records')
      .snapshots();

  @override
  Widget build(BuildContext context) {
    int index;
    return Scaffold(
      key: _scaffoldKey,
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
                child: StreamBuilder(
                  stream: mycourses,
                  builder:
                      (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                    return StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('mentors')
                          .doc('+919573604021')
                          .collection('mycourses')
                          .doc('python')
                          .collection('records')
                          .snapshots(),
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.hasError) {
                          return Text('Something went wrong');
                        }

                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return indicator(Colors.red);
                        }

                        return ListView(
                          children: snapshot.data!.docs
                              .map((DocumentSnapshot document) {
                            Map<String, dynamic> data =
                                document.data()! as Map<String, dynamic>;
                            return session_card(
                              data: data,
                            );
                          }).toList(),
                        );
                      },
                    );
                  },

//  ListView.builder(
//                   itemCount: course_data[widget.inde].record.length,
//                   itemBuilder: (context, indx) => Column(
//                     children: [
//                       session_card(
//                         inde: widget.inde,
//                         index: indx,
//                         email: course_data[widget.inde],
//                         press: () {
//                           INDEX.sessionindex.value = indx;
//                           print(INDEX.sessionindex.value);
//                         },
//                       ),
//                     ],
//                   ),
//                 ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
