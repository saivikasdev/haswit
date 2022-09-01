import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:haswit_mentor_app/indicator.dart';
import 'package:haswit_mentor_app/models/my_courses_data.dart';
import 'package:haswit_mentor_app/profile_page/constantss.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../../../constants.dart';
import '../../../extensions.dart';

class session_card extends StatefulWidget {
  const session_card({
    Key? key,
    required this.data,
  }) : super(key: key);

  final Map<String, dynamic> data;

  @override
  State<session_card> createState() => _session_cardState();
}

class _session_cardState extends State<session_card> {
  @override
  void initState() {
    Future<Set<void>> Data = FirebaseFirestore.instance
        .collection('mentors')
        .doc('+919573604021')
        .collection('mycourses')
        .doc('python')
        .collection('records')
        .doc('dsdsdsd')
        .collection('resources')
        .doc('resourcesdoc')
        .get()
        .then((doc) => {
              setState(() {
                Dat = doc.data();

                print('${doc.data()}]]]]]]]]');
              })
            });
    super.initState();
  }

  var Dat;
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: INDEX.sessionindex,
      builder: (context, value, child) => Padding(
        padding: EdgeInsets.symmetric(
            horizontal: kDefaultPadding, vertical: kDefaultPadding / 2),
        child: InkWell(
          // onTap: widget.press,
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.all(kDefaultPadding),
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(width: kDefaultPadding / 2),
                        Expanded(
                          child: Text.rich(
                            TextSpan(
                              text: "${widget.data['Rec name']} \n",
                              style: GoogleFonts.lato(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color
                                      //(widget.index == value)
                                      : Colors.white
                                  // Color(0xFF4D5875),
                                  ),
                              children: [
                                TextSpan(
                                  text:
                                      "https://www.youtube.com/watch?v=${widget.data['Rec_link']}",
                                  style: GoogleFonts.lato(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color
                                          //: (widget.index == value)
                                          : Colors.white
                                      // Color(0xFF4D5875),
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            Text(
                              widget.data['Rec_desc'],
                              style: Theme.of(context)
                                  .textTheme
                                  .caption!
                                  .copyWith(color: Colors.white70),
                            ),
                            SizedBox(height: 5),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: kDefaultPadding / 2),
                    SizedBox(height: kDefaultPadding / 2),
                    if (Dat != null)
                      Row(
                        children: [
                          InkWell(
                            onTap: () async {
                              if (!await launch('${Dat['link1']}'))
                                throw 'Could not launch ';
                            },
                            child: Container(
                              child: Center(
                                child: Text(
                                  '${Dat['name1']}',
                                  maxLines: 10,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 10, color: Colors.white
                                      //       : Colors.black,
                                      ),
                                ),
                              ),
                              decoration: BoxDecoration(
                                border:
                                    Border.all(width: 1, color: Colors.white),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              height: MediaQuery.of(context).size.height *
                                  0.1 *
                                  0.2,
                              width: MediaQuery.of(context).size.width * 0.04,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            onTap: () async {
                              if (!await launch('${Dat['link2']}'))
                                throw 'Could not launch ';
                            },
                            child: Container(
                              child: Center(
                                child: Text(
                                  '${Dat['name2']}',
                                  maxLines: 10,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 10, color: Colors.white
                                      //       : Colors.black,
                                      ),
                                ),
                              ),
                              decoration: BoxDecoration(
                                border:
                                    Border.all(width: 1, color: Colors.white),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              height: MediaQuery.of(context).size.height *
                                  0.1 *
                                  0.2,
                              width: MediaQuery.of(context).size.width * 0.04,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            onTap: () async {
                              if (!await launch('${Dat['link3']}'))
                                throw 'Could not launch ';
                            },
                            child: Container(
                              child: Center(
                                child: Text(
                                  '${Dat['name3']}',
                                  maxLines: 10,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 10, color: Colors.white
                                      //       : Colors.black,
                                      ),
                                ),
                              ),
                              decoration: BoxDecoration(
                                border:
                                    Border.all(width: 1, color: Colors.white),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              height: MediaQuery.of(context).size.height *
                                  0.1 *
                                  0.2,
                              width: MediaQuery.of(context).size.width * 0.04,
                            ),
                          ),
                        ],
                      ),
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

class tag extends StatefulWidget {
  const tag({Key? key}) : super(key: key);

  @override
  State<tag> createState() => _tagState();
}

class _tagState extends State<tag> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: INDEX.tag,
        builder: (context, value, child) => InkWell(
              child: Container(
                  child: Positioned(
                left: 8,
                top: 0,
                child: WebsafeSvg.asset(
                  "assets/Icons/Markup filled.svg",
                  height: 18,
                  color: Colors.red,
                ),
              )),
            ));
  }
}
