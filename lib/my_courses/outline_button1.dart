import 'package:flutter/material.dart';
import 'package:haswit_mentor_app/my_courses/edit_course/edit_course_form.dart';
import 'package:haswit_mentor_app/my_courses/new_course/new_course.dart';
import 'package:haswit_mentor_app/profile_page/constantss.dart';

class MyOutlineButton1 extends StatelessWidget {
  const MyOutlineButton1({
    Key? key,
    required this.imageSrc,
    required this.text,
    required this.press,
    required this.index,
  }) : super(key: key);

  final String imageSrc, text;
  final Function press;
  final int index;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: InkWell(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => edit_course(
                      index: index,
                    ))),
        child: Container(
          color: Color.fromARGB(3, 0, 0, 0),
          padding: EdgeInsets.symmetric(
            vertical: kDefaultPadding,
            horizontal: kDefaultPadding * 2.5,
          ),
          child: Row(
            children: [
              Image.asset(
                imageSrc,
                height: 40,
              ),
              SizedBox(width: kDefaultPadding),
              Text(text)
            ],
          ),
        ),
      ),
    );
  }
}
