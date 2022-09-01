import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:haswit_mentor_app/animation.dart';

class signup extends StatefulWidget {
  const signup({Key? key}) : super(key: key);

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    TextEditingController phone = TextEditingController();
    int length = 0;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(children: [
        Column(
          children: [
            FadeAnimation(
              1,
              Container(
                  width: width,
                  height: height,
                  child: Image.asset(
                    "assets/images/signup.jpg",
                    height: height * 1.5,
                    width: 500,
                    fit: BoxFit.fitHeight,
                  ),
                  color: Color.fromARGB(255, 10, 72, 83)),
            ),
          ],
        ),
        Column(
          children: [
            SizedBox(
              height: height * 0.2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FadeAnimation(
                  1.5,
                  Container(
                    width: 500 * 0.8,
                    child: TextField(
                      maxLength: 10,
                      onChanged: null,
                      controller: phone,
                      decoration: InputDecoration(
                        helperText: "Enter you mobile number",
                        labelText: "Phone number",
                        labelStyle: TextStyle(
                            fontFamily: 'Comfortaa',
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(190, 0, 0, 0)),
                        enabledBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Color.fromARGB(255, 0, 0, 0)),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 27, 154, 161),
                          ),
                        ),
                      ),
                      cursorWidth: width * 0.1 * 0.1 * 0.5,
                      cursorColor: Color.fromARGB(255, 27, 154, 161),
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height * 0.3 * 0.9,
            ),
            Row(
              children: [
                SizedBox(
                  width: width * 0.58,
                ),
                InkWell(
                    onTap: () async {
                      await FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                              email: "master@gmail.com", password: 'master');
                      // try {
                      //   await FirebaseFirestore.instance
                      //       .collection("mentors")
                      //       .doc("mentors")
                      //       .set({"name": "master"});
                      // } on Exception catch (e) {
                      //   print("succes");
                      // }
                    },
                    child: FadeAnimation(
                        3,
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black,
                          size: 40,
                        ))),
              ],
            )
          ],
        )
      ]),
    );
  }
}
