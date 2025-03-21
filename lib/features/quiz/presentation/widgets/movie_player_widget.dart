import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart' as yt_flutter;
// import 'package:youtube_player_iframe/youtube_player_iframe.dart' as yt_iframe;

class MoviePlayerWidget extends StatefulWidget {
  final String url;
  const MoviePlayerWidget({super.key, required this.url});

  @override
  MoviePlayerWidgetState createState() => MoviePlayerWidgetState();
}

class MoviePlayerWidgetState extends State<MoviePlayerWidget> {
  late yt_flutter.YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = yt_flutter.YoutubePlayerController(
      initialVideoId: yt_flutter.YoutubePlayer.convertUrlToId(widget.url)!,
      flags: const yt_flutter.YoutubePlayerFlags(
        controlsVisibleAtStart: false,
        hideControls: true,
        autoPlay: true,
        mute: false,
        disableDragSeek: true,
        loop: true,
        enableCaption: true,
        captionLanguage: 'en',
      ),
    );
  }

  @override
  void didUpdateWidget(MoviePlayerWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.url != widget.url) {
      _controller.load(yt_flutter.YoutubePlayer.convertUrlToId(widget.url)!);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      return const Placeholder();
      // Uncomment the following line to support web platform later
      // return _buildWebPlayer(widget.url);
    } else {
      return _buildMobilePlayer(widget.url);
    }
  }

  Widget _buildMobilePlayer(String url) {
    return yt_flutter.YoutubePlayerBuilder(
      player: yt_flutter.YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: false,
      ),
      builder: (context, player) {
        return ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1280, maxHeight: 720),
          child: player,
        );
      },
    );
  }

/*Widget _buildWebPlayer(String url) {
    final videoId = yt_flutter.YoutubePlayer.convertUrlToId(url)!;
    final controller = yt_iframe.YoutubePlayerController.fromVideoId(
      videoId: videoId,
      autoPlay: true,
      params: const yt_iframe.YoutubePlayerParams(
        controlsVisibleAtStart: false,
        hideControls: true,
        mute: false,
        loop: true,
        showControls: true,
        showFullscreenButton: false,
        enableCaption: true,
        captionLanguage: 'en',
      ),
    );

    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 1280, maxHeight: 720),
      child: yt_iframe.YoutubePlayer(
        controller: controller,
      ),
    );
  }*/
}