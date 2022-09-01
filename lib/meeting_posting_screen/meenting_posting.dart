import 'package:clay_containers/clay_containers.dart';
import 'package:clay_containers/widgets/clay_container.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:haswit_mentor_app/constants.dart';
import 'package:haswit_mentor_app/meeting_posting_screen/mentor_courses.dart';
import 'package:haswit_mentor_app/menu.dart';
import 'package:haswit_mentor_app/models/my_courses_data.dart';

class Meeting_posting extends StatefulWidget {
  @override
  _Meeting_postingState createState() => _Meeting_postingState();
}

class _Meeting_postingState extends State<Meeting_posting>
    with SingleTickerProviderStateMixin {
  Color baseColor = Color.fromARGB(255, 61, 61, 61);
  double firstDepth = 50;
  double secondDepth = 50;
  double thirdDepth = 50;
  double fourthDepth = 50;
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this, // the SingleTickerProviderStateMixin
      duration: Duration(seconds: 5),
    )..addListener(() {
        setState(() {});
      });

    _animationController.forward();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      OverlayState? overlayState = Overlay.of(context);
      OverlayEntry overlayEntry = OverlayEntry(builder: (context) {
        return Positioned(
            top: MediaQuery.of(context).size.height - 120,
            left: MediaQuery.of(context).size.width / 2 - 300,
            child: Material(color: Colors.transparent, child: Menu()));
      });

      overlayState?.insert(overlayEntry);
    });

    super.initState();

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    double? stagger(value, progress, delay) {
      progress = progress - (1 - delay);
      if (progress < 0) progress = 0;
      return value * (progress / delay);
    }

    double calculatedFirstDepth =
        stagger(firstDepth, _animationController.value, 0.25)!;
    double calculatedSecondDepth =
        stagger(secondDepth, _animationController.value, 0.5)!;
    double calculatedThirdDepth =
        stagger(thirdDepth, _animationController.value, 0.75)!;
    double calculatedFourthDepth =
        stagger(fourthDepth, _animationController.value, 1)!;

    var data;
    Future<Set<void>> Data = FirebaseFirestore.instance
        .collection('mentors')
        .doc('+917702795038')
        .get()
        .then((doc) => {data = doc.data()});
    return Material(
      child: ValueListenableBuilder(
        valueListenable: INDEX.courseindex,
        builder: (context, value, child) => SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: h,
                color: baseColor,
                child: Column(
                  children: [
                    SizedBox(height: h / 35),
                    Row(
                      children: [
                        SizedBox(width: h / 35),
                        InkWell(
                          onTap: () => print(data['name']),
                          child: Text(
                            'HASWIT ORGANIZATION',
                            style: GoogleFonts.lato(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.white70),
                          ),
                        ),
                        Spacer(),
                        Text(
                          'Mentor Dashboard',
                          style: GoogleFonts.lato(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white70),
                        ),
                        SizedBox(width: h / 35),
                      ],
                    ),
                    SizedBox(
                      height: h / 8,
                    ),
                    ClayContainer(
                      color: baseColor,
                      height: h / 2 + 120,
                      width: h / 2 + 120,
                      borderRadius: 200,
                      curveType: CurveType.concave,
                      spread: 30,
                      depth: calculatedFirstDepth.toInt(),
                      child: Center(
                        child: ClayContainer(
                          height: h / 2 + 80,
                          width: h / 2 + 80,
                          borderRadius: 200,
                          depth: calculatedSecondDepth.toInt(),
                          curveType: CurveType.convex,
                          color: baseColor,
                          child: Center(
                            child: ClayContainer(
                                height: h / 2 + 40,
                                width: h / 2 + 40,
                                borderRadius: 200,
                                color: baseColor,
                                depth: calculatedThirdDepth.toInt(),
                                curveType: CurveType.concave,
                                child: Center(
                                    child: ClayContainer(
                                  height: h / 2,
                                  width: h / 2,
                                  borderRadius: 200,
                                  color: baseColor,
                                  depth: calculatedFourthDepth.toInt(),
                                  curveType: CurveType.convex,
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: h / 20,
                                      ),
                                      Text(
                                        course_data[value.hashCode].name,
                                        style: GoogleFonts.fugazOne(
                                            fontSize: 15,
                                            color: Colors.white54),
                                      ),
                                      SizedBox(
                                        height: h / 20,
                                      ),
                                      Container(
                                        width: h / 3 + 40,
                                        child: TextField(
                                            cursorColor: Colors.white70,
                                            decoration: InputDecoration(
                                              prefixIcon: Icon(Icons
                                                  .emoji_emotions_outlined),
                                              prefixIconColor: Colors.white70,
                                              labelText: "Session Title",
                                              labelStyle: GoogleFonts.lato(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white70),
                                              enabledBorder: myinputborder(),
                                              focusedBorder: myfocusborder(),
                                            )),
                                      ),
                                      SizedBox(
                                        height: h / 23,
                                      ),
                                      Container(
                                        width: h / 3 + 40,
                                        child: TextField(
                                            cursorColor: Colors.white70,
                                            decoration: InputDecoration(
                                              prefixIcon: Icon(Icons.link),
                                              prefixIconColor: Colors.white70,
                                              labelText: "Meeting link",
                                              labelStyle: GoogleFonts.lato(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white70),
                                              enabledBorder: myinputborder(),
                                              focusedBorder: myfocusborder(),
                                            )),
                                      ),
                                      SizedBox(
                                        height: h / 10,
                                      ),
                                      InkWell(
                                        onTap: () => null,
                                        child: ClayContainer(
                                          borderRadius: 400,
                                          color: baseColor,
                                          child: Padding(
                                            padding: EdgeInsets.all(20),
                                            child: Text(
                                              '        OK       ',
                                              style: GoogleFonts.lato(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white54),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ))),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Mentor_courses()
            ],
          ),
        ),
      ),
    );
  }

  OutlineInputBorder myinputborder() {
    //return type is OutlineInputBorder
    return OutlineInputBorder(
        //Outline border type for TextFeild
        borderRadius: BorderRadius.all(Radius.circular(20)),
        borderSide: BorderSide(
          color: Colors.white70,
          width: 3,
        ));
  }

  OutlineInputBorder myfocusborder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        borderSide: BorderSide(
          color: Color.fromARGB(255, 255, 255, 255),
          width: 3,
        ));
  }
}
