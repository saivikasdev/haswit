import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:haswit_mentor_app/profile_page/components/default_button.dart';
import 'package:haswit_mentor_app/profile_page/components/hireme_card.dart';
import '../../components/my_outline_button.dart';
import '../../constantss.dart';
import 'components/about_section_text.dart';
import 'components/about_text_with_sign.dart';
import 'components/experience_card.dart';

class AboutSection extends StatefulWidget {
  @override
  State<AboutSection> createState() => _AboutSectionState();
}

class _AboutSectionState extends State<AboutSection> {
  @override
  void initState() {
    Future<Set<void>> Data = FirebaseFirestore.instance
        .collection('mentors')
        .doc('+917702795038')
        .get()
        .then((doc) => {
              setState(() {
                data = doc.data();
              })
            });
    FirebaseFirestore.instance
        .collection('mentors')
        .doc('+919573604021')
        .collection('mycourses')
        .get()
        .then((QuerySnapshot querySnapshot) {
      setState(() {
        length = querySnapshot.docs.length;
      });
    });
    super.initState();
  }

  late int length;
  var data;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: kDefaultPadding * 2),
      constraints: BoxConstraints(maxWidth: 1110),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AboutTextWithSign(),
              Expanded(
                child: AboutSectionText(
                  text: data['about'],
                ),
              ),
              ExperienceCard(numOfExp: length.toString()),
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 150,
                      ),
                      Transform.translate(
                        offset: Offset(0, -80),
                        child: HireMeCard(
                          text: data['phone'],
                          icon: "assets/images/phone.jpg",
                          color: Color.fromARGB(255, 255, 0, 0),
                        ),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Transform.translate(
                        offset: Offset(0, -80),
                        child: HireMeCard(
                          text: data['email'],
                          icon: "assets/images/email.png",
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Transform.translate(
                        offset: Offset(0, -80),
                        child: HireMeCard(
                          text: data['git'],
                          icon: "assets/images/github.png",
                          color: Color.fromARGB(255, 76, 0, 255),
                        ),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Transform.translate(
                        offset: Offset(0, -80),
                        child: HireMeCard(
                          text: data['whatsapp'],
                          icon: "assets/images/whatsapp.png",
                          color: Color.fromARGB(255, 255, 0, 85),
                        ),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Transform.translate(
                        offset: Offset(0, -80),
                        child:
                            // child: HireMeCard(
                            //   text:
                            //       "Cecilia Chapman 711-2880 \nNulla St. Mankato Mississi\nppi 96522",
                            //   icon: "assets/images/address.png",
                            //   color: Color.fromARGB(255, 60, 255, 0),
                            // ),

                            Container(
                          height: 40,
                          // padding: EdgeInsets.all(kDefaultPadding * 2),
                          constraints: BoxConstraints(maxWidth: 310),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0, 50),
                                blurRadius: 50,
                                color: Colors.white.withOpacity(0.10),
                              )
                            ],
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 30,
                              ),
                              Image.asset("assets/images/address.png",
                                  height: 20, width: 20),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: kDefaultPadding),
                                child: SizedBox(
                                  height: 30,
                                  child: VerticalDivider(),
                                ),
                              ),
                              Text(
                                data['address'],
                                overflow: TextOverflow.visible,
                                style: GoogleFonts.lato(
                                    fontSize: 14,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
