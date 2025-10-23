import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class WorkoutDetail extends StatefulWidget {
  final dynamic imageurl;
  const WorkoutDetail(this.imageurl, {super.key});

  @override
  State<WorkoutDetail> createState() => _WorkoutDetailState();
}

class _WorkoutDetailState extends State<WorkoutDetail> {
  late VideoPlayerController _controller;
  bool Isinitialized = false;

  @override
  void initState() {
    super.initState();
    _fetchVideo();
  }

  Future<void> _fetchVideo() async {
    try {
      const videourl =
          "https://media.musclewiki.com/media/uploads/videos/branded/male-Barbell-barbell-squat-side.mp4";
      _controller = VideoPlayerController.networkUrl(Uri.parse(videourl));
      await _controller.initialize();

      if (mounted) {
        setState(() {
          Isinitialized = true;
        });
      }
    } catch (e) {
      print("THis was the problem$e");
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("lib/assets/images/Nutback.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  if (Isinitialized)
                    Center(
                      child: AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child: VideoPlayer(_controller),
                      ),
                    ),

                  Center(
                    child: IconButton(
                      iconSize: 60,
                      color: Colors.white.withOpacity(0.8),
                      onPressed: () {
                        setState(() {
                          _controller.value.isPlaying
                              ? _controller.pause()
                              : _controller.play();
                        });
                      },
                      icon: Icon(
                        _controller.value.isPlaying
                            ? Icons.pause
                            : Icons.play_arrow,
                      ),
                    ),
                  ),
                ],
              ),
              if (!Isinitialized) CircularProgressIndicator(),
              SizedBox(height: 20),
              Expanded(
                child: SizedBox(
                  height: size.height * 0.5,
                  child: ClipRRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                      child: Container(
                        width: double.infinity,

                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          border: Border.all(
                            color: Colors.white.withOpacity(0.2),
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50),
                          ),
                        ),

                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            children: [
                              SizedBox(height: 10),
                              Text(
                                "Workout info",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Image.network("${widget.imageurl}"),
            ],
          ),
        ),
      ),
    );
  }
}
