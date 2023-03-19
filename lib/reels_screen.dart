import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:video_player/video_player.dart';

class VideoScreen extends StatefulWidget {
  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  List<String> videoUrls = [
    'https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_1mb.mp4',
    'https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_2mb.mp4',
    'https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_3mb.mp4',
  ];

  List<VideoPlayerController> _controllers = [];

  @override
  void initState() {
    super.initState();
    for (String url in videoUrls) {
      _controllers.add(VideoPlayerController.network(url)..initialize());
    }
  }

  @override
  void dispose() {
    for (VideoPlayerController controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video Screen'),
      ),
      body: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                if (_controllers[index].value.isPlaying) {
                  _controllers[index].pause();
                } else {
                  _controllers[index].play();
                }
              });
            },
            child: Stack(
              children: [
                Center(
                  child: AspectRatio(
                    aspectRatio: _controllers[index].value.aspectRatio,
                    child: VideoPlayer(_controllers[index]),
                  ),
                ),
                // Add your interactive elements (like, comment, share) here
              ],
            ),
          );
        },
        itemCount: videoUrls.length,
        loop: false,
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(),
      ),
    );
  }
}
