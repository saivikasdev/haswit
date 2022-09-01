// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:haswit_mentor_app/constants.dart';
// import 'package:websafe_svg/websafe_svg.dart';

// import '../../../constants.dart';
// import '../../../extensions.dart';

// class recording_card extends StatefulWidget {
//   const recording_card({
//     Key?key,
//     required this.index,
//     this.email,
//     this.press,
//   }) : super(key: key);

//   final int index;
//   final Email email;
//   final VoidCallback press;

//   @override
//   State<recording_card> createState() => _recording_cardState();
// }

// class _recording_cardState extends State<recording_card> {
//   @override
//   Widget build(BuildContext context) {
//     //  Here the shadow is not showing properly
//     return ValueListenableBuilder(
//       valueListenable: INDEX.sessionindex,
//       builder: (context, value, child) => Padding(
//         padding: EdgeInsets.symmetric(
//             horizontal: kDefaultPadding, vertical: kDefaultPadding / 2),
//         child: InkWell(
//           onTap: widget.press,
//           child: Stack(
//             children: [
//               Container(
//                 padding: EdgeInsets.all(kDefaultPadding),
//                 decoration: BoxDecoration(
//                   color: (widget.index == value) ? kPrimaryColor : kBgDarkColor,
//                   borderRadius: BorderRadius.circular(15),
//                 ),
//                 child: Column(
//                   children: [
//                     Row(
//                       children: [
//                         SizedBox(
//                           width: 32,
//                           child: WebsafeSvg.asset(
//                             "assets/Icons/flutter.svg",
//                           ),
//                         ),
//                         SizedBox(width: kDefaultPadding / 2),
//                         Expanded( 
//                           child: Text.rich(
//                             TextSpan(
//                               text: "${widget.email.name} \n",
//                               style: GoogleFonts.lato(
//                                 fontSize: 15,
//                                 fontWeight: FontWeight.bold,
//                                 color: (widget.index == value)
//                                     ? Colors.white
//                                     : kTextColor,
//                               ),
//                               children: [
//                                 TextSpan(
//                                   text: widget.email.subject,
//                                   style: GoogleFonts.lato(
//                                     fontSize: 15,
//                                     fontWeight: FontWeight.bold,
//                                     color: (widget.index == value)
//                                         ? Colors.white
//                                         : kTextColor,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                         Column(
//                           children: [
//                             Text(
//                               widget.email.time,
//                               style:
//                                   Theme.of(context).textTheme.caption!.copyWith(
//                                         color: (widget.index == value)
//                                             ? Colors.white70
//                                             : null,
//                                       ),
//                             ),
//                             SizedBox(height: 5),
//                             // if (email.isAttachmentAvailable)
//                             //   WebsafeSvg.asset(
//                             //     "assets/Icons/Paperclip.svg",
//                             //     color: isActive ? Colors.white70 : kGrayColor,
//                             //   )
//                           ],
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: kDefaultPadding / 2),
//                     Text(
//                       widget.email.body,
//                       maxLines: 2,
//                       overflow: TextOverflow.ellipsis,
//                       style: GoogleFonts.lato(
//                         fontSize: 12,
//                         fontWeight: FontWeight.bold,
//                         color: (widget.index == value) ? Colors.white70 : null,
//                       ),
//                     )
//                   ],
//                 ),
//               ).addNeumorphism(
//                 blurRadius: 15,
//                 borderRadius: 15,
//                 offset: Offset(5, 5),
//                 topShadowColor: Colors.white60,
//                 bottomShadowColor: Color(0xFF234395).withOpacity(0.15),
//               ),
//               if (widget.email.tagColor != null)
//                 Positioned(
//                   left: 8,
//                   top: 0,
//                   child: WebsafeSvg.asset(
//                     "assets/Icons/Markup filled.svg",
//                     height: 18,
//                     color: widget.email.tagColor,
//                   ),
//                 )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class tag extends StatefulWidget {
//   const tag({Key?key}) : super(key: key);

//   @override
//   State<tag> createState() => _tagState();
// }

// class _tagState extends State<tag> {
//   @override
//   Widget build(BuildContext context) {
//     return ValueListenableBuilder(
//         valueListenable: INDEX.tag,
//         builder: (context, value, child) => InkWell(
//               child: Container(
//                   child: Positioned(
//                 left: 8,
//                 top: 0,
//                 child: WebsafeSvg.asset(
//                   "assets/Icons/Markup filled.svg",
//                   height: 18,
//                   color: value,
//                 ),
//               )),
//             ));
//   }
// }
