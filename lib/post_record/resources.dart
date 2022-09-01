import 'package:clay_containers/widgets/clay_container.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:haswit_mentor_app/constants.dart';
import 'package:haswit_mentor_app/details%20data/login_widget.dart';
import 'package:haswit_mentor_app/models/my_courses_data.dart';

class Resources extends StatefulWidget {
  final String rec_name, rec_desc, rec_link;

  Resources(this.rec_name, this.rec_desc, this.rec_link);

  @override
  State<Resources> createState() => _ResourcesState();
}

class _ResourcesState extends State<Resources> {
  TextEditingController res1 = TextEditingController();
  TextEditingController res2 = TextEditingController();
  TextEditingController res3 = TextEditingController();
  TextEditingController link1 = TextEditingController();
  TextEditingController link2 = TextEditingController();
  TextEditingController link3 = TextEditingController();
  int resources = 0;

  void resplus() {
    if (resources == 3) {
      setState(() {
        resources = 3;
      });
    } else {
      setState(() {
        resources++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    List<TextEditingController> recs = [
      res1,
      res2,
      res3,
    ];
    List<TextEditingController> links = [link1, link2, link3];
    Color baseColor = Color.fromARGB(255, 8, 84, 171);
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return ValueListenableBuilder(
      valueListenable: INDEX.courseindex,
      builder: (context, value, child) => Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: h / 70,
              ),
              Row(
                  children: List.generate(
                      resources,
                      (index) => Row(
                            children: [
                              SizedBox(
                                width: 20,
                              ),
                              Column(
                                children: [
                                  Container(
                                    width: h / 5,
                                    child: TextField(
                                        controller: recs[index],
                                        cursorColor: Colors.white70,
                                        decoration: InputDecoration(
                                          prefixIcon:
                                              Icon(Icons.newspaper_outlined),
                                          prefixIconColor: Colors.white70,
                                          labelText: "Resource name",
                                          labelStyle: GoogleFonts.lato(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white70),
                                          enabledBorder: myinputborder(),
                                          focusedBorder: myfocusborder(),
                                        )),
                                  ),
                                  SizedBox(
                                    height: h / 100,
                                  ),
                                  Container(
                                    width: h / 5,
                                    child: TextField(
                                        controller: links[index],
                                        cursorColor: Colors.white70,
                                        decoration: InputDecoration(
                                          prefixIcon: Icon(Icons.link),
                                          prefixIconColor: Colors.white70,
                                          labelText: "Resource link",
                                          labelStyle: GoogleFonts.lato(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white70),
                                          enabledBorder: myinputborder(),
                                          focusedBorder: myfocusborder(),
                                        )),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 10,
                              ),
                            ],
                          ))),
              SizedBox(
                width: h / 70,
              ),
              InkWell(
                onTap: resplus,
                child: ClayContainer(
                  borderRadius: 400,
                  color: baseColor,
                  child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Icon(
                        Icons.add,
                        color: Colors.white70,
                      )),
                ),
              ),
            ],
          ),
          SizedBox(
            height: h / 20,
          ),
          InkWell(
            onTap: () async {
              // FirebaseAuth Auth = FirebaseAuth.instance;
              // String? user = Auth.currentUser!.phoneNumber;
              // print('$user}------');
              try {
                await FirebaseFirestore.instance
                    .collection('courses')
                    .doc(course_data[value.hashCode].name)
                    .collection('records')
                    .doc(widget.rec_name)
                    .set({
                  'Rec name': widget.rec_name,
                  'Rec_desc': widget.rec_desc,
                  'Rec_link': widget.rec_link,
                });

                await FirebaseFirestore.instance
                    .collection('courses')
                    .doc(course_data[value.hashCode].name)
                    .collection('records')
                    .doc(widget.rec_name)
                    .collection('resources')
                    .doc('resourcesdoc')
                    .set(
                  {
                    'name1': res1.text,
                    'link1': link1.text,
                    'name2': res2.text,
                    'link2': link2.text,
                    'name3': res3.text,
                    'link3': link3.text,
                  },
                );

                await FirebaseFirestore.instance
                    .collection('mentors')
                    .doc('+919573604021')
                    .collection('mycourses')
                    .doc(course_data[value.hashCode].name)
                    .collection('records')
                    .doc(widget.rec_name)
                    .set({
                  'Rec name': widget.rec_name,
                  'Rec_desc': widget.rec_desc,
                  'Rec_link': widget.rec_link,
                });

                await FirebaseFirestore.instance
                    .collection('mentors')
                    .doc('+919573604021')
                    .collection('mycourses')
                    .doc(course_data[value.hashCode].name)
                    .collection('records')
                    .doc(widget.rec_name)
                    .collection('resources')
                    .doc('resourcesdoc')
                    .set(
                  {
                    'name1': res1.text,
                    'link1': link1.text,
                    'name2': res2.text,
                    'link2': link2.text,
                    'name3': res3.text,
                    'link3': link3.text,
                  },
                );
              } on Exception catch (e) {
                showSnackBar(context, e.toString());
                print('---------${e}');
              }
            },
            child: ClayContainer(
              borderRadius: 400,
              color: baseColor,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  'POST RECORD',
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
