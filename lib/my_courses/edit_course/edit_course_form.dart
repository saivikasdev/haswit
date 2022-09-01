import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:haswit_mentor_app/models/my_courses_data.dart';
import 'package:haswit_mentor_app/my_courses/edit_course/made_social_card.dart';
import 'package:haswit_mentor_app/my_courses/edit_course/record_box.dart';
import 'package:haswit_mentor_app/profile_page/components/default_button.dart';
import 'package:haswit_mentor_app/profile_page/components/section_title.dart';
import 'package:haswit_mentor_app/profile_page/constantss.dart';
import 'package:haswit_mentor_app/profile_page/sections/contact/components/socal_card.dart';

class edit_course extends StatelessWidget {
  const edit_course({
    Key? key,
    required this.index,
  }) : super(key: key);
  final int index;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          edit_cource(index: index,inde:index),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Expanded(
              child: ListView.builder(
                itemCount: course_data[index].record.length,
                itemBuilder: (context, indx) => Column(
                  children: [
                    rec_box(
                      index: indx,
                      course_index: index,
                      // email: course_data[0],
                      // press: () {
                      //   INDEX.sessionindex.value = indx;
                      //   print(INDEX.sessionindex.value);
                      // },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class edit_cource extends StatelessWidget {
  const edit_cource({
    Key? key,
    required this.index,
    required this.inde,
  }) : super(key: key);
  final int index;
  final int inde;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        // this height only for demo
        // height: 500,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xFFE8F0F9),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("assets/images/background.webp"),
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: kDefaultPadding * 2.5),
            SectionTitle(
              title: "COURSE DETAILS",
              subTitle: "EDIT",
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            ContactBox(index: index,inde:inde),
          ],
        ),
      ),
    );
  }
}

class ContactBox extends StatelessWidget {
  const ContactBox({
    Key? key,
    required this.index,
    required this.inde,

  }) : super(key: key);
  final int index;
  final int inde;

  @override
  Widget build(BuildContext context) {
    double hei = MediaQuery.of(context).size.height;
    return Container(
      constraints: BoxConstraints(maxWidth: 1110, maxHeight: hei / 2 * 1.3),
      margin: EdgeInsets.only(top: kDefaultPadding * 2),
      padding: EdgeInsets.all(kDefaultPadding * 3),
      decoration: BoxDecoration(
          color: Colors.white,
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
              made_social_card(
                color: Color.fromARGB(255, 199, 245, 255),
                iconSrc: course_data[inde].icon,
                name: 'Update Course Icon',
                press: () {},
              ),
              // SocalCard(
              //   color: Color(0xFFE8F0F9),
              //   iconSrc: "assets/images/messanger.png",
              //   name: 'TheFlutterWay',
              //   press: () {},
              // ),
            ],
          ),
          SizedBox(height: kDefaultPadding * 2),
          ContactForm(index: index),
        ],
      ),
    );
  }
}

class ContactForm extends StatelessWidget {
  const ContactForm({
    Key? key,
    required this.index,
  }) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Wrap(
        spacing: kDefaultPadding * 2.5,
        runSpacing: kDefaultPadding * 1.5,
        children: [
          SizedBox(
            width: 470,
            child: TextFormField(
              initialValue: course_data[index].name,
              onChanged: (value) {},
              decoration: InputDecoration(
                labelText: "Update Course Name",
                hintText: "Enter Course Name",
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 2,
            // height: 300,
            // TextField by default cover the height, i tryed to fix this problem but i cant
            child: TextFormField(
              initialValue: course_data[index].desc,
              onChanged: (value) {},
              decoration: InputDecoration(
                labelText: "Change Description",
                hintText: "Course description",
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 2,
            // height: 300,
            // TextField by default cover the height, i tryed to fix this problem but i cant
            child: TextFormField(
              initialValue: course_data[index].meeting_time,
              onChanged: (value) {},
              decoration: InputDecoration(
                labelText: "Daily session time",
                hintText: "Daily session time",
              ),
            ),
          ),
          SizedBox(height: kDefaultPadding),
          Center(
            child: FittedBox(
              child: DefaultButton(
                imageSrc: "assets/images/contact_icon.png",
                text: "Update data!",
                press: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
