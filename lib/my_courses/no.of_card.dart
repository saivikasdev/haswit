import 'package:flutter/material.dart';
import 'package:haswit_mentor_app/profile_page/constantss.dart';

class No_of_card extends StatelessWidget {
  const No_of_card({
    Key? key,
    required this.numOfExp,
    required this.text,
  }) : super(key: key);

  final int numOfExp;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      padding: EdgeInsets.all(kDefaultPadding),
      height: 150,
      width: 140,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 91, 223, 240),
        borderRadius: BorderRadius.circular(50),
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 91, 223, 240),
          borderRadius: BorderRadius.circular(50),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 3),
              blurRadius: 6,
              color: Color.fromARGB(255, 10, 83, 94),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                Text(
                  "{$numOfExp}",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 6
                      ..color = Color.fromARGB(255, 91, 223, 240),
                    shadows: [
                      BoxShadow(
                        offset: Offset(0, 5),
                        blurRadius: 10,
                        color: Color.fromARGB(255, 10, 83, 94).withOpacity(0.5),
                      ),
                    ],
                  ),
                ),
                Text(
                  "{$numOfExp}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.white,
                  ),
                )
              ],
            ),
            SizedBox(height: kDefaultPadding / 2),
            Text(
              text,
              style: TextStyle(
                color: Color.fromARGB(255, 10, 83, 94),
              ),
            )
          ],
        ),
      ),
    );
  }
}
