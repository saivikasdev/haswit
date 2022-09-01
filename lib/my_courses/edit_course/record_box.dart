import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:haswit_mentor_app/models/my_courses_data.dart';
import 'package:haswit_mentor_app/profile_page/components/default_button.dart';
import 'package:haswit_mentor_app/profile_page/constantss.dart';

class rec_box extends StatelessWidget {
  const rec_box({
    Key? key,
    required this.index,
    required this.course_index,
  }) : super(key: key);
  final int index, course_index;
  @override
  Widget build(BuildContext context) {
    double wid = MediaQuery.of(context).size.height;

    double hei = MediaQuery.of(context).size.width;
    return Material(
      child: Container(
        margin: EdgeInsets.only(top: kDefaultPadding * 2),
        padding: EdgeInsets.all(kDefaultPadding * 3),
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 233, 233, 233),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // SocalCard(
                //   color: Color(0xFFD9FFFC),
                //   iconSrc: "assets/images/profile.png",
                //   name: 'Update profile picture',
                //   press: () {},
                // ),

                // SocalCard(
                //   color: Color(0xFFE8F0F9),
                //   iconSrc: "assets/images/messanger.png",
                //   name: 'TheFlutterWay',
                //   press: () {},
                // ),
              ],
            ),
            SizedBox(height: kDefaultPadding * 2),
            ContactForm(
              index: index,
              course_index: course_index,
            ),
          ],
        ),
      ),
    );
  }
}

class ContactForm extends StatelessWidget {
  const ContactForm({
    Key? key,
    required this.index,
    required this.course_index,
  }) : super(key: key);
  final int index, course_index;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Wrap(
        spacing: kDefaultPadding * 2.5,
        runSpacing: kDefaultPadding * 1.5,
        children: [
          Row(
            children: [
              Text(
                "Session ${index + 1}",
                style:
                    GoogleFonts.fugazOne(fontSize: 40, color: Colors.black87),
              ),
              SizedBox(
                width: 60,
              ),
              Column(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 5,
                    child: TextFormField(
                      initialValue: course_data[course_index].record[index]
                          ['title'],
                      onChanged: (value) {},
                      decoration: InputDecoration(
                        labelText: "Name",
                        hintText: "name",
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 5,
                    // height: 300,
                    // TextField by default cover the height, i tryed to fix this problem but i cant
                    child: TextFormField(
                      initialValue: course_data[course_index].record[index]
                          ['description'],
                      onChanged: (value) {},
                      decoration: InputDecoration(
                        labelText: "Description",
                        hintText: "description",
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 5,
                    child: TextFormField(
                      initialValue: course_data[course_index].record[index]
                          ['youtubelink'],
                      onChanged: (value) {},
                      decoration: InputDecoration(
                        labelText: "Youtube link",
                        hintText: "youtube link",
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(width: kDefaultPadding * 3),
              Column(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 6,
                    // height: 300,
                    // TextField by default cover the height, i tryed to fix this problem but i cant
                    child: TextFormField(
                      initialValue: course_data[course_index]
                                  .record[index]['resources']
                                  .length ==
                              0
                          ? ""
                          : course_data[course_index].record[index]['resources']
                              [0],
                      onChanged: (value) {},
                      decoration: InputDecoration(
                        labelText: "Rescource 1 Name",
                        hintText: "rescource 1 name",
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 6,
                    child: TextFormField(
                      initialValue: course_data[course_index]
                                  .record[index]['resourceslink']
                                  .length ==
                              0
                          ? ""
                          : course_data[course_index].record[index]
                              ['resourceslink'][0],
                      onChanged: (value) {},
                      decoration: InputDecoration(
                        labelText: "Rescource 1 Link",
                        hintText: "Rescource 1 Link",
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(width: kDefaultPadding * 3),
              Column(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 6,
                    // height: 300,
                    // TextField by default cover the height, i tryed to fix this problem but i cant
                    child: TextFormField(
                      initialValue: course_data[course_index]
                                      .record[index]['resources']
                                      .length ==
                                  3 ||
                              course_data[course_index]
                                      .record[index]['resources']
                                      .length ==
                                  2
                          ? course_data[course_index].record[index]['resources']
                              [1]
                          : "",
                      onChanged: (value) {},
                      decoration: InputDecoration(
                        labelText: "Rescource 2 Name",
                        hintText: "Rescource 2 Name",
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 6,
                    child: TextFormField(
                      initialValue: course_data[course_index]
                                      .record[index]['resourceslink']
                                      .length ==
                                  3 ||
                              course_data[course_index]
                                      .record[index]['resourceslink']
                                      .length ==
                                  2
                          ? course_data[course_index].record[index]
                              ['resourceslink'][1]
                          : "",
                      onChanged: (value) {},
                      decoration: InputDecoration(
                        labelText: "Rescource 2 Link",
                        hintText: "Rescource 2 Link",
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(width: kDefaultPadding * 3),
              Column(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 6,
                    // height: 300,
                    // TextField by default cover the height, i tryed to fix this problem but i cant
                    child: TextFormField(
                      initialValue: course_data[course_index]
                                  .record[index]['resources']
                                  .length ==
                              3
                          ? course_data[course_index].record[index]['resources']
                              [2]
                          : "",
                      onChanged: (value) {},
                      decoration: InputDecoration(
                        labelText: "Rescource 3 Name",
                        hintText: "Rescource 3 Name",
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 6,
                    child: TextFormField(
                      initialValue: course_data[course_index]
                                  .record[index]['resourceslink']
                                  .length ==
                              3
                          ? course_data[course_index].record[index]
                              ['resourceslink'][2]
                          : "",
                      onChanged: (value) {},
                      decoration: InputDecoration(
                        labelText: "Rescource 3 Link",
                        hintText: "Rescource 3 Link",
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
