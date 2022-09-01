import 'package:clay_containers/clay_containers.dart';
import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:haswit_mentor_app/constants.dart';
import 'package:haswit_mentor_app/meeting_posting_screen/mentor_courses.dart';
import 'package:haswit_mentor_app/models/my_courses_data.dart';
import 'package:haswit_mentor_app/post_record/resources.dart';

class post_rec extends StatefulWidget {
  @override
  _post_recState createState() => _post_recState();
}

class _post_recState extends State<post_rec>
    with SingleTickerProviderStateMixin {
  Color baseColor = Color.fromARGB(255, 8, 84, 171);
  double firstDepth = 50;
  double secondDepth = 50;
  double thirdDepth = 50;
  double fourthDepth = 50;
  late AnimationController _animationController;
  TextEditingController rec_name = TextEditingController();
  TextEditingController rec_desc = TextEditingController();
  TextEditingController rec_link = TextEditingController();

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this, // the SingleTickerProviderStateMixin
      duration: Duration(seconds: 5),
    )..addListener(() {
        setState(() {});
      });

    _animationController.forward();

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
                        Text(
                          'HASWIT ORGANIZATION',
                          style: GoogleFonts.lato(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white70),
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
                      height: h / 20,
                    ),
                    ClayContainer(
                      color: baseColor,
                      height: h / 2 + 120 + 100 + 100,
                      width: h / 2 + 120 + 100 + 100 + 100,
                      borderRadius: 200,
                      curveType: CurveType.concave,
                      spread: 30,
                      depth: calculatedFirstDepth.toInt(),
                      child: Center(
                        child: ClayContainer(
                          height: h / 2 + 80 + 100 + 100,
                          width: h / 2 + 80 + 100 + 100 + 100,
                          borderRadius: 200,
                          depth: calculatedSecondDepth.toInt(),
                          curveType: CurveType.convex,
                          color: baseColor,
                          child: Center(
                            child: ClayContainer(
                                height: h / 2 + 40 + 100 + 100,
                                width: h / 2 + 40 + 100 + 100 + 100,
                                borderRadius: 200,
                                color: baseColor,
                                depth: calculatedThirdDepth.toInt(),
                                curveType: CurveType.concave,
                                child: Center(
                                    child: ClayContainer(
                                  height: h / 2 + 100 + 100,
                                  width: h / 2 + 100 + 100 + 100,
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
                                            controller: rec_name,
                                            cursorColor: Colors.white70,
                                            decoration: InputDecoration(
                                              prefixIcon: Icon(Icons
                                                  .emoji_emotions_outlined),
                                              prefixIconColor: Colors.white70,
                                              labelText: "Session Name",
                                              labelStyle: GoogleFonts.lato(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white70),
                                              enabledBorder: myinputborder(),
                                              focusedBorder: myfocusborder(),
                                            )),
                                      ),
                                      SizedBox(
                                        height: h / 30,
                                      ),
                                      Container(
                                        width: h / 3 + 40,
                                        child: TextField(
                                            controller: rec_desc,
                                            cursorColor: Colors.white70,
                                            decoration: InputDecoration(
                                              prefixIcon: Icon(Icons.link),
                                              prefixIconColor: Colors.white70,
                                              labelText: "Description",
                                              labelStyle: GoogleFonts.lato(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white70),
                                              enabledBorder: myinputborder(),
                                              focusedBorder: myfocusborder(),
                                            )),
                                      ),
                                      SizedBox(
                                        height: h / 30,
                                      ),
                                      Container(
                                        width: h / 3 + 40,
                                        child: TextField(
                                            controller: rec_link,
                                            cursorColor: Colors.white70,
                                            decoration: InputDecoration(
                                              prefixIcon: Icon(Icons
                                                  .slow_motion_video_outlined),
                                              prefixIconColor: Colors.white70,
                                              labelText: "Youtube link",
                                              labelStyle: GoogleFonts.lato(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white70),
                                              enabledBorder: myinputborder(),
                                              focusedBorder: myfocusborder(),
                                            )),
                                      ),
                                      SizedBox(
                                        height: h / 20,
                                      ),
                                      Resources(rec_name.text,rec_desc.text,rec_link.text),
                                      
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
