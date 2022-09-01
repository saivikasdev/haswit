import 'package:flutter/material.dart';
import 'package:haswit_mentor_app/my_courses/new_course/new_course.dart';

import '../constantss.dart';

class MyOutlineButton extends StatelessWidget {
  const MyOutlineButton({
    Key? key,
    required this.imageSrc,
    required this.text,
    required this.press,
  }) : super(key: key);

  final String imageSrc, text;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: InkWell(
        onTap: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => new_course())),
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
