import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart' as yt_flutter;
// import 'package:youtube_player_iframe/youtube_player_iframe.dart' as yt_iframe;

class MoviePlayerWidget extends StatelessWidget {
  final String url;
  const MoviePlayerWidget({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      return const Placeholder();
      // return _buildWebPlayer(url);
    } else {
      return _buildMobilePlayer(url);
    }
  }

  Widget _buildMobilePlayer(String url) {
    final controller = yt_flutter.YoutubePlayerController(
      initialVideoId: yt_flutter.YoutubePlayer.convertUrlToId(url)!,
      flags: const yt_flutter.YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
        disableDragSeek: true,
        loop: true,
        enableCaption: true,
        captionLanguage: 'en',
      ),
    );

    return yt_flutter.YoutubePlayerBuilder(
      player: yt_flutter.YoutubePlayer(
        controller: controller,
        showVideoProgressIndicator: false,
        aspectRatio: 16 / 9,
      ),
      builder: (context, player) {
        return ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 720),
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
        mute: false,
        loop: true,
        showControls: true,
        showFullscreenButton: false,
        enableCaption: true,
        captionLanguage: 'en',
      ),
    );

    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 720),
      child: yt_iframe.YoutubePlayer(
        controller: controller,
        aspectRatio: 16 / 9,
      ),
    );
  }*/
}