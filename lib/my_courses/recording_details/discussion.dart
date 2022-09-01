import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:haswit_mentor_app/constants.dart';
import 'package:haswit_mentor_app/extensions.dart';
import 'package:haswit_mentor_app/profile_page/constantss.dart';
import 'package:websafe_svg/websafe_svg.dart';

class discussion extends StatelessWidget {
  const discussion({
    Key?key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Padding(
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
                        "DISCUSSION",
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
                  SizedBox(height: kDefaultPadding / 2),
                  Container(
                    height: 50,
                    child: Expanded(
                      child: TextField(
                        onChanged: (value) {},
                        decoration: InputDecoration(
                          hintText: "Your Message",
                          fillColor: kBgLightColor,
                          filled: true,
                          suffixIcon: Padding(
                            padding:  EdgeInsets.all(
                                kDefaultPadding * 0.75), //15
                            child: WebsafeSvg.asset(
                              "assets/Icons/send2.svg",
                              width: 24,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  SizedBox(height: kDefaultPadding / 2),
                  Container(
                    height: 300,
                    child: ListView(
                      children: [
                        ChatBubble(
                          text: 'How was the concert?',
                          isCurrentUser: false,
                        ),
                        ChatBubble(
                          text: 'Awesome! Next time you gotta come as well!',
                          isCurrentUser: true,
                        ),
                        ChatBubble(
                          text: 'Ok, when is the next date?',
                          isCurrentUser: false,
                        ),
                        ChatBubble(
                          text:
                              'They\'re playing on the 20th of November dshihswdswiud efuhsiufiucesui fcesgcyujsfcgesu fcsfgcbsduy',
                          isCurrentUser: true,
                        ),
                        ChatBubble(
                          text: 'Let\'s do it!',
                          isCurrentUser: false,
                        ),
                        ChatBubble(
                          text: 'Let\'s do it!',
                          isCurrentUser: false,
                        ),
                        ChatBubble(
                          text: 'Let\'s do it!',
                          isCurrentUser: true,
                        ),
                      ],
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
          ],
        ),
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  const ChatBubble({
    Key?key,
    required this.text,
    required this.isCurrentUser,
  }) : super(key: key);
  final String text;
  final bool isCurrentUser;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        isCurrentUser ? 64.0 : 16.0,
        4,
        isCurrentUser ? 16.0 : 64.0,
        4,
      ),
      child: Align(
        // align the child within the container
        alignment: isCurrentUser ? Alignment.centerRight : Alignment.centerLeft,
        child: DecoratedBox(
          // chat bubble decoration
          decoration: BoxDecoration(
            color: isCurrentUser ? Colors.blue : Colors.grey[300],
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Text(
              text,
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  color: isCurrentUser ? Colors.white : Colors.black87),
            ),
          ),
        ),
      ),
    );
  }
}
