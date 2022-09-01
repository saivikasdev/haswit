import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:haswit_mentor_app/models/my_courses_data.dart';
import 'package:haswit_mentor_app/profile_page/constantss.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../../../constants.dart';
import '../../../extensions.dart';

class rec_card extends StatefulWidget {
  const rec_card({
    Key? key,
    required this.index,
    required this.email,
    required this.press,
  }) : super(key: key);

  final int index;
  final Course_data email;
  final VoidCallback press;

  @override
  State<rec_card> createState() => _rec_cardState();
}

class _rec_cardState extends State<rec_card> {
  @override
  Widget build(BuildContext context) {
    //  Here the shadow is not showing properly
    return ValueListenableBuilder(
      valueListenable: INDEX.sessionindex,
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
                  color: (widget.index == value) ? kPrimaryColor : kBgDarkColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(width: kDefaultPadding / 2),
                        Expanded(
                          child: Text.rich(
                            TextSpan(
                              text:
                                  "${widget.email.record![widget.index]['title']} \n",
                              style: GoogleFonts.lato(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: (widget.index == value)
                                    ? Colors.white
                                    : Color(0xFF4D5875),
                              ),
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            Text(
                              widget.email.name.toString(),
                              style:
                                  Theme.of(context).textTheme.caption!.copyWith(
                                        color: (widget.index == value)
                                            ? Colors.white70
                                            : null,
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
                    SizedBox(height: kDefaultPadding / 5),
                    Text(
                      widget.email.record![widget.index]['description'],
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.lato(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: (widget.index == value) ? Colors.white70 : null,
                      ),
                    ),
                    SizedBox(height: kDefaultPadding / 2),
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
