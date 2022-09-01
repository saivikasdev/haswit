import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:haswit_mentor_app/profile_page/components/default_button.dart';
import 'package:haswit_mentor_app/profile_page/components/section_title.dart';
import 'package:haswit_mentor_app/profile_page/constantss.dart';
import 'package:haswit_mentor_app/profile_page/sections/contact/components/socal_card.dart';

class new_course extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController name = TextEditingController();
    TextEditingController live = TextEditingController();
    TextEditingController desc = TextEditingController();
    return Material(
      child: SingleChildScrollView(
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
                title: "NEW COURSE",
                subTitle: "ADD",
                color: Color.fromARGB(255, 255, 255, 255),
              ),
              ContactBox()
            ],
          ),
        ),
      ),
    );
  }
}

class ContactBox extends StatelessWidget {
  const ContactBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController name = TextEditingController();
    TextEditingController live = TextEditingController();
    TextEditingController desc = TextEditingController();
    var data;
    Future<Set<void>> Data = FirebaseFirestore.instance
        .collection('mentors')
        .doc('+917702795038')
        .get()
        .then((doc) => {data = doc.data()});

    return Container(
      constraints: BoxConstraints(maxWidth: 1110),
      margin: EdgeInsets.only(top: kDefaultPadding * 2),
      padding: EdgeInsets.all(kDefaultPadding * 3),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
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
              SocalCard(
                color: Color.fromARGB(255, 255, 199, 199),
                iconSrc: "assets/icons/degree.svg",
                name: 'Course Icon',
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
          Form(
            child: Wrap(
              spacing: kDefaultPadding * 2.5,
              runSpacing: kDefaultPadding * 1.5,
              children: [
                SizedBox(
                  width: 470,
                  child: TextFormField(
                    controller: name,
                    onChanged: (value) {},
                    decoration: InputDecoration(
                      labelText: "Course Name",
                      hintText: "Enter Course Name",
                    ),
                  ),
                ),
                SizedBox(
                  width: 470,
                ),
                SizedBox(
                  width: 270,
                  child: TextFormField(
                    controller: live,
                    onChanged: (value) {},
                    decoration: InputDecoration(
                      labelText: "Live session time",
                      hintText: "Live session time",
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  // height: 300,
                  // TextField by default cover the height, i tryed to fix this problem but i cant
                  child: TextFormField(
                    controller: desc,
                    onChanged: (value) {},
                    decoration: InputDecoration(
                      labelText: "Description",
                      hintText: "Course description",
                    ),
                  ),
                ),
                SizedBox(height: kDefaultPadding * 2),
                Center(
                  child: FittedBox(
                    child: InkWell(
                      onTap: () async {
                        await FirebaseFirestore.instance
                            .collection('courses')
                            .doc(name.text)
                            .set({
                          'course name': name.text,
                          'livetime': live.text,
                          'description': desc.text,
                          'mentor': data['name'],
                          'about': data['about']
                        });
                        await FirebaseFirestore.instance
                            .collection('mentors')
                            .doc('+919573604021')
                            .collection('mycourses')
                            .doc(name.text)
                            .set({
                          'course name': name.text,
                          'livetime': live.text,
                          'description': desc.text,
                        });
                      },
                      child: DefaultButton(
                          imageSrc: "assets/images/contact_icon.png",
                          text: "Add course!",
                          press: () {}),
                    ),
                  ),
                ),
                SizedBox(
                  height: 200,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ContactForm extends StatelessWidget {
  var data;

  ContactForm(this.data);

  @override
  Widget build(BuildContext context) {
    TextEditingController name = TextEditingController();
    TextEditingController live = TextEditingController();
    TextEditingController desc = TextEditingController();

    return Form(
      child: Wrap(
        spacing: kDefaultPadding * 2.5,
        runSpacing: kDefaultPadding * 1.5,
        children: [
          SizedBox(
            width: 470,
            child: TextFormField(
              controller: name,
              onChanged: (value) {},
              decoration: InputDecoration(
                labelText: "Course Name",
                hintText: "Enter Course Name",
              ),
            ),
          ),
          SizedBox(
            width: 470,
          ),
          SizedBox(
            width: 270,
            child: TextFormField(
              controller: live,
              onChanged: (value) {},
              decoration: InputDecoration(
                labelText: "Live session time",
                hintText: "Live session time",
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 2,
            // height: 300,
            // TextField by default cover the height, i tryed to fix this problem but i cant
            child: TextFormField(
              controller: desc,
              onChanged: (value) {},
              decoration: InputDecoration(
                labelText: "Description",
                hintText: "Course description",
              ),
            ),
          ),
          SizedBox(height: kDefaultPadding * 2),
          Center(
            child: FittedBox(
              child: InkWell(
                onTap: () async {
                  print('${data['name']}------');
                  // await FirebaseFirestore.instance
                  //     .collection('courses')
                  //     .doc(name.text)
                  //     .set({
                  //   'course name': name.text,
                  //   'livetime': live.text,
                  //   'description': desc.text,
                  //   'mentor': data['name'],
                  //   'about': data['about']
                  // });
                },
                child: DefaultButton(
                    imageSrc: "assets/images/contact_icon.png",
                    text: "Add course!",
                    press: () {}),
              ),
            ),
          ),
          SizedBox(
            height: 200,
          ),
        ],
      ),
    );
  }
}
