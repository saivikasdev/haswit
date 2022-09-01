import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:haswit_mentor_app/constants.dart';
import 'package:haswit_mentor_app/extensions.dart';
import 'package:haswit_mentor_app/models/my_courses_data.dart';
import 'package:haswit_mentor_app/profile_page/constantss.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:websafe_svg/websafe_svg.dart';

class resources extends StatelessWidget {
    const resources({
    super.key,
    required this.inde,
  });
  final int inde;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: INDEX.sessionindex,
      builder: (context, value, child) => Padding(
        padding: EdgeInsets.symmetric(
            horizontal: kDefaultPadding, vertical: kDefaultPadding / 2),
        child: InkWell(
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.all(kDefaultPadding),
                decoration: BoxDecoration(
                  color: Color.fromARGB(95, 231, 230, 230),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "RESOURCES",
                          style: GoogleFonts.lato(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Colors.black54),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Row(
                      children: [
                        Row(
                          children: List.generate(
                            course_data[inde].record[value]['resources'].length,
                            (indx) => InkWell(
                              onTap: () async {
                                if (!await launch(course_data[inde].record![value]
                                    ['resourceslink'][indx]))
                                  throw 'Could not launch ';
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 6),
                                height: MediaQuery.of(context).size.height / 25,
                                child: Container(
                                  padding: EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                    color: kPrimaryColor,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Row(
                                    children: [
                                      Center(
                                        child: Text(
                                          "${course_data[inde].record![value]['resources'][indx]} \n",
                                          style: GoogleFonts.lato(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ).addNeumorphism(
                                  blurRadius: 15,
                                  borderRadius: 15,
                                  offset: Offset(5, 5),
                                  topShadowColor: Colors.white60,
                                  bottomShadowColor:
                                      Color(0xFF234395).withOpacity(0.15),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ).addNeumorphism(
                blurRadius: 15,
                borderRadius: 15,
                offset: Offset(5, 5),
                topShadowColor: Colors.white60,
                bottomShadowColor: Color(0xFF234395).withOpacity(0.15),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class resources_card extends StatelessWidget {
  const resources_card({
    Key? key,
    this.isActive = true,
    required this.name,
    required this.press,
  }) : super(key: key);

  final bool isActive;
  final String name;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    //  Here the shadow is not showing properly
    return Container(
      height: MediaQuery.of(context).size.height / 25,
      child: InkWell(
        onTap: press,
        child: Container(
          padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [
              Center(
                child: Text(
                  "${name} \n",
                  style: GoogleFonts.lato(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ).addNeumorphism(
          blurRadius: 15,
          borderRadius: 15,
          offset: Offset(5, 5),
          topShadowColor: Colors.white60,
          bottomShadowColor: Color(0xFF234395).withOpacity(0.15),
        ),
      ),
    );
  }
}

void _launchURL(_url) async {
  if (!await launchUrl(_url)) throw 'Could not launch $_url';
}
