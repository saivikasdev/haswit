import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:haswit_mentor_app/models/my_courses_data.dart';
import 'package:haswit_mentor_app/profile_page/constantss.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../../../constants.dart';
import '../../../extensions.dart';

class user_card extends StatefulWidget {
  const user_card({
    Key? key,
    required this.index,
    required this.email,
    required this.press,
  }) : super(key: key);

  final int index;
  final Course_data email;
  final VoidCallback press;

  @override
  State<user_card> createState() => _user_cardState();
}

class _user_cardState extends State<user_card> {
  @override
  Widget build(BuildContext context) {
    //  Here the shadow is not showing properly
    return ValueListenableBuilder(
      valueListenable: INDEX.userindex,
      builder: (context, value, child) => Padding(
        padding: EdgeInsets.symmetric(
            horizontal: kDefaultPadding, vertical: kDefaultPadding / 2),
        child: InkWell(
          onTap: widget.press,
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.all(kDefaultPadding),
                decoration: BoxDecoration(
                  color: (widget.index == value)
                      ? Color.fromARGB(255, 0, 71, 153)
                      : Color.fromARGB(255, 173, 211, 255),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                            width: 32,
                            child: Image.asset(
                                widget.email.users![widget.index]['icon'])),
                        SizedBox(width: kDefaultPadding / 2),
                        Expanded(
                          child: Text.rich(
                            TextSpan(
                              text:
                                  "${widget.email.users![widget.index]['title']} \n",
                              style: GoogleFonts.lato(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: (widget.index == value)
                                    ? Colors.white
                                    : TextColor,
                              ),
                              children: [
                                TextSpan(
                                  text: widget.email.users![widget.index]
                                      ['phone'],
                                  style: GoogleFonts.lato(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: (widget.index == value)
                                        ? Colors.white
                                        : TextColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            Text(
                              widget.email.users![widget.index]['whatsapp'],
                              style:
                                  Theme.of(context).textTheme.caption!.copyWith(
                                        color: (widget.index == value)
                                            ? Colors.white
                                            : TextColor,
                                      ),
                            ),
                            Text(
                              widget.email.users![widget.index]['github'],
                              style:
                                  Theme.of(context).textTheme.caption!.copyWith(
                                        color: (widget.index == value)
                                            ? Colors.white
                                            : TextColor,
                                      ),
                            ),
                            SizedBox(height: 5),
                            // if (email.isAttachmentAvailable)
                            //   WebsafeSvg.asset(
                            //     "assets/Icons/Paperclip.svg",
                            //     color: isActive ? Colors.white70 : kGrayColor,
                            //   )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: kDefaultPadding / 2),
                    Text(
                      widget.email.users![widget.index]['gmail'],
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.lato(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color:
                            (widget.index == value) ? Colors.white : TextColor,
                      ),
                    )
                  ],
                ),
              ).addNeumorphism(
                blurRadius: 15,
                borderRadius: 15,
                offset: Offset(5, 5),
                topShadowColor: Colors.white60,
                bottomShadowColor: Color(0xFF234395).withOpacity(0.15),
              ),
              // if (widget.email.tagColor != null)
              //   Positioned(
              //     left: 8,
              //     top: 0,
              //     child: WebsafeSvg.asset(
              //       "assets/Icons/Markup filled.svg",
              //       height: 18,
              //       color: widget.email.tagColor,
              //     ),
              //   )
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
