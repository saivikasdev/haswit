import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:haswit_mentor_app/meeting_posting_screen/meenting_posting.dart';
import 'package:url_launcher/url_launcher.dart';
import 'app_size.dart';
import 'app_style.dart';
import 'welcome_widget.dart';

class LoginClipper extends CustomClipper<Path> {
  // 第一个点
  Point p1 = Point(0.0, 54.0);
  Point c1 = Point(20.0, 25.0);
  Point c2 = Point(81.0, -8.0);
  // 第二个点
  Point p2 = Point(160.0, 20.0);
  Point c3 = Point(216.0, 38.0);
  Point c4 = Point(280.0, 73.0);
  // 第三个点
  Point p3 = Point(280.0, 44.0);
  Point c5 = Point(280.0, -11.0);
  Point c6 = Point(330.0, 8.0);

  @override
  Path getClip(Size size) {
    // 第四个点
    Point p4 = Point(size.width, .0);

    Path path = Path();
    // 移动到第一个点
    path.moveTo(p1.x.toDouble(), p1.y.toDouble());
    //第一阶段 三阶贝塞尔曲线
    path.cubicTo(c1.x.toDouble(), c1.y.toDouble(), c2.x.toDouble(),
        c2.y.toDouble(), p2.x.toDouble(), p2.y.toDouble());
    //第二阶段 三阶贝塞尔曲线
    path.cubicTo(c3.x.toDouble(), c3.y.toDouble(), c4.x.toDouble(),
        c4.y.toDouble(), p3.x.toDouble(), p3.y.toDouble());
    //第三阶段 三阶贝塞尔曲线
    path.cubicTo(c5.x.toDouble(), c5.y.toDouble(), c6.x.toDouble(),
        c6.y.toDouble(), p4.x.toDouble(), p4.y.toDouble());
    // 连接到右下角
    path.lineTo(size.width, size.height);
    // 连接到左下角
    path.lineTo(0, size.height);
    //闭合
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return this.hashCode != oldClipper.hashCode;
  }
}

/// 登录图标按钮
class LoginBtnIconWidget extends StatefulWidget {
  final String name;
  final String phone;
  final String email;
  final String wtsp;
  final String git;
  final String about;
  final String addrss;

  LoginBtnIconWidget(
    this.name,
    this.phone,
    this.email,
    this.wtsp,
    this.git,
    this.about,
    this.addrss,
  );

  @override
  State<LoginBtnIconWidget> createState() => _LoginBtnIconWidgetState();
}

class _LoginBtnIconWidgetState extends State<LoginBtnIconWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 500 * 0.6),
        GradientBtnWidget(
          width: 160,
          
          child: Row(
            children: [
              SizedBox(width: 34),
              BtnTextWhiteWidget(
                text: 'Finish',
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

void showSnackBar(BuildContext context, String text) {
  final snackBar = SnackBar(
      content: Text(
        text,
        style: GoogleFonts.fugazOne(),
      ),
      backgroundColor: Color.fromARGB(255, 0, 106, 99));
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

class LoginInput extends StatelessWidget {
  const LoginInput({
    Key? key,
    required this.width,
    required this.controller,
    required this.hintText,
    required this.prefixIcon,
    this.obscureText = false,
  }) : super(key: key);

  final double width;
  final TextEditingController controller;
  final String hintText;
  final Icon prefixIcon;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      // width: 500 * 0.89,width,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          border: kInputBorder,
          focusedBorder: kInputBorder,
          enabledBorder: kInputBorder,
          prefixIcon: Container(
              width: kIconBoxSize,
              height: kIconBoxSize,
              alignment: Alignment.center,
              child: prefixIcon),
        ),
        obscureText: obscureText,
        style: kBodyTextStyle.copyWith(
          fontSize: 18,
        ),
      ),
    );
  }
}

/// 返回图标
class BackIcon extends StatelessWidget {
  const BackIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Center(
        child: Container(
            width: kIconBoxSize,
            height: kIconBoxSize,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.arrow_back_ios)),
      ),
    );
  }
}
