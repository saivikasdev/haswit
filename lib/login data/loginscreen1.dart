import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:haswit_mentor_app/animation.dart';
import 'package:haswit_mentor_app/otpdata/otpscree.dart';
import 'package:haswit_mentor_app/signupdata/signupscreen1.dart';

class loginscreen extends StatefulWidget {
  const loginscreen({Key? key}) : super(key: key);

  @override
  State<loginscreen> createState() => _loginscreenState();
}

class _loginscreenState extends State<loginscreen> {
  String verificationIdFinal = "";
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    TextEditingController phone = TextEditingController(text: "+91");
    int length = 0;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Column(
            children: [
              FadeAnimation(
                1,
                Container(
                  width: width,
                  height: height,
                  child: Image.asset(
                    "assets/images/loginpage.jpg",
                    height: height * 1.5,
                    width: 500,
                    fit: BoxFit.fitHeight,
                  ),
                  color: Color.fromARGB(189, 255, 124, 36),
                ),
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
                      child: TextFormField(
                        maxLength: 13,
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
                              color: Color.fromARGB(255, 255, 124, 36),
                            ),
                          ),
                        ),
                        cursorWidth: 3,
                        cursorColor: Color.fromARGB(255, 255, 124, 36),
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.phone,
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
                      onTap: () => {
                                print(phone.text),
                            // print(phone.text),

                            // (FirebaseAuth.instance.currentUser != null)
                            //     ? print(FirebaseAuth.instance.currentUser)
                            //     : print("-----------"),

                            // Navigator.of(context).push(
                            //   MaterialPageRoute(
                            //       builder: (context) =>
                            //           Otp(verificationIdFinal, phone.text)),
                            // ),
                            // //         ),
                             verifyphonenumber(phone.text, context, setData),
                          },
                      child: FadeAnimation(
                          2,
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.black,
                            size: 40,
                          ))),
                ],
              ),
            ],
          ),
          Column(
            children: [
              SizedBox(
                height: height * 0.9,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                      onTap: () {
                        navigate();
                      },
                      child: FadeAnimation(
                          3,
                          Text(
                            "Do not have an account?   Signup",
                            style: TextStyle(
                                fontFamily: 'Comfortaa',
                                color: Colors.white,
                                fontWeight: FontWeight.w700),
                          ))),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  void navigate() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => signup()));
  }

  Future<void> verifyphonenumber(
      String phoneNumber, BuildContext context, Function setData) async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    PhoneVerificationCompleted verificationCompleted =
        (PhoneAuthCredential phoneAuthCredential) async {
      showSnackBar(context, "Verification Completed");
    };
    PhoneVerificationFailed verificationFailed =
        (FirebaseAuthException exception) {
      showSnackBar(context, exception.toString());
    };
    PhoneCodeSent codeSent = (String verificationID, int) {
      showSnackBar(context, "Verification Code sent on the phone number");
      setData(verificationID);
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Otp(verificationIdFinal, phoneNumber)));
    };

    PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
        (String verificationID) {
      showSnackBar(context, "Time out");
    };

    try {
      await _auth.verifyPhoneNumber(
          timeout: Duration(seconds: 60),
          phoneNumber: phoneNumber,
          verificationCompleted: verificationCompleted,
          verificationFailed: verificationFailed,
          codeSent: codeSent,
          codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  Future<void> signInwithPhoneNumber(
      String verificationId, String smsCode, BuildContext context) async {
    print("otpotpotp");
    final FirebaseAuth _auth = FirebaseAuth.instance;
    try {
      AuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: smsCode);

      UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      // Navigator.pushAndRemoveUntil(context,
      //     MaterialPageRoute(builder: (builder) => Otp()), (route) => false);

      showSnackBar(context, "logged In");
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void showSnackBar(BuildContext context, String text) {
    final snackBar = SnackBar(
        content: Text(
          text,
          style: GoogleFonts.fugazOne(),
        ),
        backgroundColor: Color.fromARGB(255, 0, 106, 99));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void setData(String verificationId) {
    setState(() {
      verificationIdFinal = verificationId;
    });
    startTimer();
  }

  void startTimer() {}
}
