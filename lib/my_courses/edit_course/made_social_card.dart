import 'package:flutter/material.dart';
import 'package:haswit_mentor_app/models/my_courses_data.dart';
import 'package:haswit_mentor_app/profile_page/constantss.dart';
import 'package:websafe_svg/websafe_svg.dart';

class made_social_card extends StatefulWidget {
  const made_social_card({
    Key? key,
    required this.iconSrc,
    required this.name,
    required this.color,
    required this.press,
  }) : super(key: key);

  final String iconSrc, name;
  final Color color;
  final Function press;

  @override
  _made_social_cardState createState() => _made_social_cardState();
}

class _made_social_cardState extends State<made_social_card> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: InkWell(
        onTap: null,
        onHover: (value) {
          setState(() {
            isHover = value;
          });
        },
        child: AnimatedContainer(
          width: MediaQuery.of(context).size.width / 2,
          duration: Duration(milliseconds: 200),
          padding: EdgeInsets.symmetric(
            vertical: kDefaultPadding / 2,
            horizontal: kDefaultPadding * 1.5,
          ),
          decoration: BoxDecoration(
            color: widget.color,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [if (isHover) kDefaultCardShadow],
          ),
          child: Row(
            children: [
              Image.asset(
                widget.iconSrc,
                width: 80,
                height: 80,
              ),
              SizedBox(width: kDefaultPadding),
              Text(widget.name),
            ],
          ),
        ),
      ),
    );
  }
}
