import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_auth/email_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';
import 'package:haswit_mentor_app/animation.dart';
import 'package:haswit_mentor_app/details%20data/app_size.dart';
import 'package:haswit_mentor_app/details%20data/welcome_widget.dart';
import 'package:haswit_mentor_app/meeting_posting_screen/meenting_posting.dart';

import '../my_courses/new_course/new_course.dart';
import 'app_colors.dart';
import 'app_style.dart';
import 'login_widget.dart';

/// 登录页面
class details extends StatefulWidget {
  final String phone;

  details(this.phone);
  @override
  _detailsState createState() => _detailsState();
}

class _detailsState extends State<details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Container(
          child: Stack(
            children: [
              FadeAnimation(
                  1,
                  Image.asset(
                    'assets/images/i10.webp',
                    width: 500,
                  )),
              SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 320),
                    ClipPath(
                      clipper: LoginClipper(),
                      child: LoginBodyWidget(widget.phone),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 64,
                left: 28,
                child: BackIcon(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

/// 登录页面内容体
class LoginBodyWidget extends StatefulWidget {
  final String phone;

  LoginBodyWidget(this.phone);

  @override
  State<LoginBodyWidget> createState() => _LoginBodyWidgetState();
}

class _LoginBodyWidgetState extends State<LoginBodyWidget> {
  TextEditingController otp = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController about = TextEditingController();
  TextEditingController wtsp = TextEditingController();
  TextEditingController git = TextEditingController();
  TextEditingController addrss = TextEditingController();
  void sendotp() async {
    print("========");
    var emailauth = EmailAuth(sessionName: "email verify");
    var res = await emailauth.sendOtp(recipientMail: email.text);
    res;
    if (res) {
      print("otp sent");
    } else {
      print("otp cant send");
    }
  }

  void verifyotp() {
    var emailauth = EmailAuth(sessionName: "email verify");
    var res =
        emailauth.validateOtp(recipientMail: email.text, userOtp: otp.text);

    print("::::::::");
    if (res) {
      print("otp verified");
    } else {
      print("invalid otp");
      print(name.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.maxFinite,
      padding: EdgeInsets.all(32),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 86),
            FadeAnimation(
              1.1,
              InkWell(
                onTap: () => print(name.text),
                child: Text(
                  'Add details to go on',
                  style: kTitleTextStyle,
                ),
              ),
            ),
            SizedBox(height: 20),
            FadeAnimation(
              1.2,
              Text(
                'Enter your name',
                style: kBodyTextStyle,
              ),
            ),
            SizedBox(height: 4),
            FadeAnimation(
              1.3,
              LoginInput(
                controller: name,
                width: 500 * 0.89,
                hintText: 'Your name',
                prefixIcon: Icon(
                  Icons.person,
                  color: Color.fromARGB(255, 255, 94, 0),
                ),
              ),
            ),
            SizedBox(height: 16),
            FadeAnimation(
              1.4,
              Text(
                'Enter your email address',
                style: kBodyTextStyle,
              ),
            ),
            SizedBox(height: 4),
            Row(
              children: [
                FadeAnimation(
                  1.5,
                  LoginInput(
                    controller: email,
                    width: 500 * 0.5,
                    hintText: 'Your email address',
                    prefixIcon: Icon(
                      Icons.email,
                      color: Color.fromARGB(255, 255, 94, 0),
                    ),
                  ),
                ),
                SizedBox(width: 20),
                FadeAnimation(
                    2.6, InkWell(onTap: () => sendotp(), child: emailveri())),
              ],
            ),
            SizedBox(height: 15),
            FadeAnimation(
              1.4,
              Text(
                'Enter OTP',
                style: kBodyTextStyle,
              ),
            ),
            SizedBox(height: 4),
            Row(
              children: [
                FadeAnimation(
                  1.5,
                  LoginInput(
                    controller: otp,
                    width: 500 * 0.5,
                    hintText: 'Otp here',
                    prefixIcon: Icon(
                      Icons.email,
                      color: Color.fromARGB(255, 255, 94, 0),
                    ),
                    obscureText: true,
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                FadeAnimation(
                    2.6, InkWell(onTap: () => verifyotp(), child: otpveri())),
              ],
            ),
            SizedBox(height: 15),
            FadeAnimation(
              1.8,
              Text(
                'Tell us about you',
                style: kBodyTextStyle,
              ),
            ),
            SizedBox(height: 4),
            FadeAnimation(
              2,
              LoginInput(
                controller: about,
                width: 500 * 0.89,
                hintText: 'about me',
                prefixIcon: Icon(
                  Icons.alternate_email,
                  color: Color.fromARGB(255, 255, 94, 0),
                ),
              ),
            ),
            SizedBox(height: 15),
            FadeAnimation(
              1.8,
              Text(
                'Enter your whatsapp number',
                style: kBodyTextStyle,
              ),
            ),
            SizedBox(height: 4),
            FadeAnimation(
              2,
              LoginInput(
                controller: wtsp,
                width: 500 * 0.89,
                hintText: 'whatsapp number',
                prefixIcon: Icon(
                  Icons.whatsapp,
                  color: Color.fromARGB(255, 255, 94, 0),
                ),
              ),
            ),
            SizedBox(height: 15),
            FadeAnimation(
              1.8,
              Text(
                'Your github repository',
                style: kBodyTextStyle,
              ),
            ),
            SizedBox(height: 4),
            FadeAnimation(
              2,
              LoginInput(
                controller: git,
                width: 500 * 0.89,
                hintText: 'paste here..',
                prefixIcon: Icon(
                  Icons.code,
                  color: Color.fromARGB(255, 255, 94, 0),
                ),
              ),
            ),
            SizedBox(height: 15),
            FadeAnimation(
              1.8,
              InkWell(
                onTap: () => print(widget.phone),
                child: Text(
                  'Your address',
                  style: kBodyTextStyle,
                ),
              ),
            ),
            SizedBox(height: 4),
            FadeAnimation(
              2,
              LoginInput(
                controller: addrss,
                width: 500 * 0.89,
                hintText: 'Enter your address',
                prefixIcon: Icon(
                  Icons.push_pin,
                  color: Color.fromARGB(255, 255, 94, 0),
                ),
              ),
            ),
            SizedBox(height: 32),
            FadeAnimation(
                2.6,
                InkWell(
                  onTap: () {
                    adduser(email.text, name.text, about.text, wtsp.text,
                        git.text, addrss.text, widget.phone, context);
                  },
                  child: LoginBtnIconWidget(name.text, widget.phone, email.text,
                      wtsp.text, git.text, about.text, addrss.text),
                )),
            SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}

adduser(String email, String name, String about, String wtsp, String git,
    String addrss, String phone, BuildContext context) async {
  FirebaseFirestore db = FirebaseFirestore.instance;
  if (name == '' || email == '' || wtsp == '' || git == '' || about == '') {
    showSnackBar(context, "You left something empty please check");
  } else {
    await db.collection("mentors").doc(phone).set({
      'name': name,
      'phone': phone,
      'email': email,
      'whatsapp': wtsp,
      'git': git,
      'about': about,
      'address': addrss,
    }).then(
      (value) => Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (builder) => Meeting_posting()),
          (route) => false),
    );
  }
}

class emailveri extends StatelessWidget {
  const emailveri({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GradientBtnWidget(
          width: 160,
          child: Row(
            children: [
              SizedBox(width: 34),
              BtnTextWhiteWidget(
                text: 'Send',
              ),
              Spacer(),
              Image.asset(
                'assets/images/icon_arrow_right.png',
                width: kIconSize,
                height: kIconSize,
              ),
              SizedBox(width: 24),
            ],
          ),
        ),
      ],
    );
  }
}

class otpveri extends StatelessWidget {
  const otpveri({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GradientBtnWidget(
          width: 160,
          child: Row(
            children: [
              SizedBox(width: 34),
              BtnTextWhiteWidget(
                text: 'Verify',
              ),
              Spacer(),
              Image.asset(
                'assets/images/icon_arrow_right.png',
                width: kIconSize,
                height: kIconSize,
              ),
              SizedBox(width: 24),
            ],
          ),
        ),
      ],
    );
  }
}
