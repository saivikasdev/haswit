import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:haswit_mentor_app/animation.dart';
import 'package:haswit_mentor_app/details%20data/detailsscreen.dart';

class Otp extends StatefulWidget {
  final String verificationIdFinal, phone;

  Otp(this.verificationIdFinal, this.phone);

  @override
  _OtpState createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  TextEditingController one = TextEditingController();
  TextEditingController two = TextEditingController();
  TextEditingController three = TextEditingController();
  TextEditingController four = TextEditingController();
  TextEditingController five = TextEditingController();
  TextEditingController six = TextEditingController();
  late Timer _timer;
  int _start = 60;
  @override
  void initState() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final otp =
        "${one.text}${two.text}${three.text}${four.text}${five.text}${six.text}";
    // TextEditingController one = TextEditingController();
    // TextEditingController two = TextEditingController();
    // TextEditingController three = TextEditingController();
    // TextEditingController four = TextEditingController();
    // TextEditingController five = TextEditingController();
    // TextEditingController six = TextEditingController();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xfff7f6fb),
      body: Center(
        child: Container(
          color: Color.fromARGB(255, 246, 239, 255),
          width: 500,
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 24, horizontal: 32),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: FadeAnimation(
                        0.7,
                        Icon(
                          Icons.arrow_back_ios,
                          size: 32,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  FadeAnimation(
                    1,
                    Container(
                      height: 190,
                      width: 190,
                      decoration: BoxDecoration(
                        color: Colors.deepPurple.shade50,
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(
                        'assets/images/fruits.png',
                        width: 500,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  FadeAnimation(
                    1.1,
                    Text(
                      'Verification',
                      style: TextStyle(
                        fontFamily: 'Comfortaa',
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  FadeAnimation(
                    1.3,
                    Text(
                      "Enter your OTP code number",
                      style: TextStyle(
                        fontFamily: 'Comfortaa',
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black38,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 28,
                  ),
                  Container(
                    padding: EdgeInsets.all(28),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            FadeAnimation(
                                1.7,
                                _textFieldOTP(
                                    first: true, last: false, controller: one)),
                            FadeAnimation(
                                1.8,
                                _textFieldOTP(
                                    first: true, last: false, controller: two)),
                            FadeAnimation(
                                1.9,
                                _textFieldOTP(
                                    first: true,
                                    last: false,
                                    controller: three)),
                            FadeAnimation(
                                2,
                                _textFieldOTP(
                                    first: true,
                                    last: false,
                                    controller: four)),
                            FadeAnimation(
                                1.8,
                                _textFieldOTP(
                                    first: true,
                                    last: false,
                                    controller: five)),
                            FadeAnimation(
                                1.8,
                                _textFieldOTP(
                                    first: true, last: false, controller: six)),
                          ],
                        ),
                        SizedBox(
                          height: 22,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: FadeAnimation(
                            2.3,
                            ElevatedButton(
                              onPressed: () {
                                print(widget.phone);
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) =>
                                //             details(widget.phone)));
                                signInwithPhoneNumber(
                                    widget.verificationIdFinal,
                                    "${one.text}${two.text}${three.text}${four.text}${five.text}${six.text}",
                                    context);
                                // print(widget.verificationIdFinal);
                                // print(
                                //     "${one.text}${two.text}${three.text}${four.text}${five.text}${six.text}");
                              },
                              style: ButtonStyle(
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.purple),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(24.0),
                                  ),
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(14.0),
                                child: Text(
                                  'Verify',
                                  style: TextStyle(
                                      fontFamily: 'Comfortaa', fontSize: 16),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  FadeAnimation(
                    2.4,
                    Text(
                      "$_start",
                      style: TextStyle(
                        fontFamily: 'Comfortaa',
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black38,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  FadeAnimation(
                    3,
                    Text(
                      "Resend New Code",
                      style: TextStyle(
                        fontFamily: 'Comfortaa',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _textFieldOTP({
    required bool first,
    last,
    required TextEditingController controller,
  }) {
    return Container(
      height: 85,
      width: 50,
      child: AspectRatio(
        aspectRatio: 1.0,
        child: TextField(
          controller: controller,
          autofocus: true,
          onChanged: (value) {
            if (value.length == 1 && last == false) {
              FocusScope.of(context).nextFocus();
            }
            if (value.length == 0 && first == false) {
              FocusScope.of(context).previousFocus();
            }
          },
          showCursor: false,
          readOnly: false,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: InputDecoration(
            counter: Offstage(),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: Colors.black12),
                borderRadius: BorderRadius.circular(12)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: Colors.purple),
                borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ),
    );
  }

  Future<void> signInwithPhoneNumber(
      String verificationId, String smsCode, BuildContext context) async {
    print("otpotpotp");
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final User? user = _auth.currentUser;
    var phone = user?.phoneNumber;
    try {
      AuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: smsCode);

      UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (builder) => details(widget.phone)),
          (route) => false);
     
      showSnackBar(context, "Verified your number");

      //TODO
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
}
