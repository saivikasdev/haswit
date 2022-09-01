import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:haswit_mentor_app/my_courses/list_of_ses.dart';
import 'package:haswit_mentor_app/my_courses/records_details/list_of_rec.dart';
import 'package:haswit_mentor_app/my_courses/side_menu.dart';
import 'package:haswit_mentor_app/my_courses/video_screen.dart';

class recor_detail extends StatefulWidget {
 const recor_detail({super.key,  required this.inde});
  final int inde;

  @override
  State<recor_detail> createState() => _recor_detailState();
}

class _recor_detailState extends State<recor_detail> {
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Row(
      children: [
        // Once our width is less then 1300 then it start showing errors
        // Now there is no error if our width is less then 1340
        Expanded(
          flex: _size.width > 1340 ? 2 : 4,
          child: SideMenu(inde:widget.inde),
        ),
        Expanded(flex: _size.width > 1340 ? 3 : 5, child: list_of_rec(inde:widget.inde)),
        Expanded(
          flex: _size.width > 1340 ? 8 : 10,
          child: video_screen(inde:widget.inde),
        ),
      ],
    );
  }
}
