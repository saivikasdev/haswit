import 'package:flutter/material.dart';
import 'package:haswit_mentor_app/profile_page/components/section_title.dart';
import 'package:haswit_mentor_app/profile_page/models/Feedback.dart';

import '../../constantss.dart';
import 'components/feedback_card.dart';

class FeedbackSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: kDefaultPadding * 2.5),
      constraints: BoxConstraints(maxWidth: 1110),
      child: Column(
        children: [
          SectionTitle(
            title: "You may enroll",
            subTitle: "Courses",
            color: Color(0xFF00B1FF),
          ),
          SizedBox(height: kDefaultPadding),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              feedbacks.length,
              (index) => FeedbackCard(index: index)
            ),
          ),
        ],
      ),
    );
  }
}
