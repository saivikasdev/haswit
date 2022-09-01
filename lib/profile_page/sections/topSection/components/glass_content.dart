import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import '../../../constantss.dart';

class GlassContent extends StatefulWidget {
  const GlassContent({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  State<GlassContent> createState() => _GlassContentState();
}

class _GlassContentState extends State<GlassContent> {
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
    super.initState();
  }

  var data;
  @override
  Widget build(BuildContext context) {
    if (data != null) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: kDefaultPadding * 2),
          constraints: BoxConstraints(
              maxWidth: 1110, maxHeight: widget.size.height * 0.7),
          width: double.infinity,
          color: Colors.white.withOpacity(0),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () => print(data!['name']),
                    child: Text(
                      "Hello There!",
                      style: GoogleFonts.lato(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),

                  Text(
                    data!['name'],
                    style: GoogleFonts.lato(
                        fontSize: 100,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  // Text(
                  //   "Creative Design Director",
                  //   style: Theme.of(context)
                  //       .textTheme
                  //       .headline5
                  //       .copyWith(color: Colors.white),
                  // )
                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 20,
              ),
            ],
          ),
        ),
      );
    } else {
      return LiquidLinearProgressIndicator();
    }
  }
}
