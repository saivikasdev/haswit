import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:haswit_mentor_app/models/my_courses_data.dart';
import 'package:haswit_mentor_app/my_courses/recording_details/description.dart';
import 'package:haswit_mentor_app/my_courses/recording_details/discussion.dart';
import 'package:haswit_mentor_app/my_courses/recording_details/instructor.dart';
import 'package:haswit_mentor_app/my_courses/recording_details/resources.dart';
import 'package:haswit_mentor_app/my_courses/video_headre.dart';
import 'package:haswit_mentor_app/profile_page/constantss.dart';
import 'package:websafe_svg/websafe_svg.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

import '../../constants.dart';
import '../../responsive.dart';

class video_screen extends StatefulWidget {
  const video_screen({
    super.key,
    required this.inde,
  });
  final int inde;

  @override
  State<video_screen> createState() => _video_screenState();
}

class _video_screenState extends State<video_screen> {
  late YoutubePlayerController youtubePlayerController;
  TextEditingController youtubeLink = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    int i = 0;
    List<dynamic> pages = [
      description(
        inde: widget.inde,
      ),
      discussion(),
      resources(
        inde: widget.inde,
      ),
      mentor_details(
        inde: widget.inde,
      ),
    ];
    return ValueListenableBuilder(
      valueListenable: INDEX.sessionindex,
      builder: (context, value, child) => Scaffold(
        body: Container(
          color: Colors.white,
          child: SafeArea(
            child: Column(
              children: [
                Header(
                  inde: widget.inde,
                ),
                Divider(thickness: 1),
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.all(kDefaultPadding),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () => i++,
                          child: SizedBox(
                            child: CircleAvatar(
                              maxRadius: 35,
                              backgroundColor: Colors.transparent,
                              backgroundImage:
                                  AssetImage(course_data[widget.inde].icon),
                            ),
                          ),
                        ),
                        SizedBox(width: kDefaultPadding),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text.rich(
                                          TextSpan(
                                            text: course_data[widget.inde]
                                                .record[value]['title'],
                                            style: GoogleFonts.lato(
                                                fontSize: 40,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black87),
                                          ),
                                        ),
                                        Text(
                                          "Mentor :${course_data[widget.inde].mentor_name}",
                                          style: GoogleFonts.lato(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black38),
                                        )
                                      ],
                                    ),
                                  ),
                                  // SizedBox(width: kDefaultPadding / 2),
                                  Spacer(),
                                  Text(
                                    "19:32",
                                    style: Theme.of(context).textTheme.caption,
                                  ),
                                ],
                              ),
                              SizedBox(height: kDefaultPadding),
                              SizedBox(
                                height: 600,
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: player(
                                      inde: widget.inde,
                                    )),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Divider(thickness: 1),
                              //  pages[value],
                              pagez(
                                inde: widget.inde,
                              ),
                              Divider(thickness: 1),
                              SizedBox(
                                height: 120,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class player extends StatefulWidget {
  const player({
    super.key,
    required this.inde,
  });
  final int inde;

  @override
  State<player> createState() => _playerState();
}

class _playerState extends State<player> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: INDEX.sessionindex,
      builder: (context, value, child) => Padding(
        padding: const EdgeInsets.all(0),
        child: YoutubePlayerIFrame(
          controller: YoutubePlayerController(
            initialVideoId: course_data[widget.inde].record[0]['youtubelink'],
            params: YoutubePlayerParams(
              playlist: [course_data[widget.inde].record[0]['youtubelink']],
              showControls: true,
              showFullscreenButton: true,
            ),
          ),
          aspectRatio: 18 / 4,
        ),
      ),
    );
  }
}

class pagez extends StatefulWidget {
  const pagez({
    super.key,
    required this.inde,
  });
  final int inde;

  @override
  State<pagez> createState() => _pagezState();
}

class _pagezState extends State<pagez> {
  @override
  Widget build(BuildContext context) {
    List<dynamic> pages = [
      description(
        inde: widget.inde,
      ),
      discussion(),
      resources(
        inde: widget.inde,
      ),
      mentor_details(
        inde: widget.inde,
      ),
    ];
    return ValueListenableBuilder(
      valueListenable: INDEX.index,
      builder: (context, value, child) => pages[value.hashCode],
    );
  }
}
