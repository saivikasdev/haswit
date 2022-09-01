import 'dart:ui';

import 'package:clay_containers/clay_containers.dart';
import 'package:clay_containers/widgets/clay_container.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

import '../../constantss.dart';
import 'components/logo_blur_box.dart';
import 'components/person_pic.dart';

class TopSection extends StatefulWidget {
  @override
  State<TopSection> createState() => _TopSectionState();
}

class _TopSectionState extends State<TopSection> {
  
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    Color baseColor = Color.fromARGB(255, 127, 70, 83);
    Size size = MediaQuery.of(context).size;
    double i = 0.0;
    return Container(
      color: baseColor,
      alignment: Alignment.center,
      constraints: BoxConstraints(maxHeight: 1000, minHeight: 700),
      width: double.infinity,
      // decoration: BoxDecoration(
      //   image: DecorationImage(
      //     fit: BoxFit.cover,
      //     image: AssetImage("assets/images/background.png"),
      //   ),
      // ),
      child: Container(
        margin: EdgeInsets.only(top: kDefaultPadding),
        width: 1200,
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  height: h / 10 + 55,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: w / 4 + 90,
                    ),
                    claycontainer(),
                  ],
                ),
              ],
            ),
            LogoAndBlurBox(size: size),
            Positioned(
              left: 630,
              top: 220,
              child: CircleAvatar(
                radius: 200, // Image radius
                backgroundImage: AssetImage('assets/images/people.png'),
              ),
            ),
            
             
          ],
        ),
      ),
    );
  }
}

class claycontainer extends StatefulWidget {
  const claycontainer({super.key});

  @override
  State<claycontainer> createState() => _claycontainerState();
}

class _claycontainerState extends State<claycontainer>
    with SingleTickerProviderStateMixin {
  Color baseColor = Color.fromARGB(255, 127, 70, 83);
  double firstDepth = 50;
  double secondDepth = 50;
  double thirdDepth = 50;
  double fourthDepth = 50;
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this, // the SingleTickerProviderStateMixin
      duration: Duration(seconds: 5),
    )..addListener(() {
        setState(() {});
      });

    _animationController.forward();

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    double? stagger(value, progress, delay) {
      progress = progress - (1 - delay);
      if (progress < 0) progress = 0;
      return value * (progress / delay);
    }

    double calculatedFirstDepth =
        stagger(firstDepth, _animationController.value, 0.25)!;
    double calculatedSecondDepth =
        stagger(secondDepth, _animationController.value, 0.5)!;
    double calculatedThirdDepth =
        stagger(thirdDepth, _animationController.value, 0.75)!;
    double calculatedFourthDepth =
        stagger(fourthDepth, _animationController.value, 1)!;

    return ClayContainer(
      color: baseColor,
      height: h / 2.5 + 120,
      width: h / 2.5 + 120,
      borderRadius: 200,
      curveType: CurveType.concave,
      spread: 30,
      depth: calculatedFirstDepth.toInt(),
      child: Center(
        child: ClayContainer(
          height: h / 2.5 + 80,
          width: h / 2.5 + 80,
          borderRadius: 200,
          depth: calculatedSecondDepth.toInt(),
          curveType: CurveType.convex,
          color: baseColor,
          child: Center(
            child: ClayContainer(
                height: h / 2.5 + 40,
                width: h / 2.5 + 40,
                borderRadius: 200,
                color: baseColor,
                depth: calculatedThirdDepth.toInt(),
                curveType: CurveType.concave,
                child: Center(
                    child: ClayContainer(
                  height: h / 2.5,
                  width: h / 2.5,
                  borderRadius: 200,
                  color: baseColor,
                  depth: calculatedFourthDepth.toInt(),
                  curveType: CurveType.convex,
                ))),
          ),
        ),
      ),
    );
  }
}
