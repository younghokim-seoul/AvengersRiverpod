import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VedioScreen extends ConsumerStatefulWidget {
  static const routeName = '/vedio';

  const VedioScreen(
    this.vedioKey, {
    Key? key,
  }) : super(key: key);

  final String vedioKey;

  @override
  ConsumerState createState() => _VedioScreenState();
}

class _VedioScreenState extends ConsumerState<VedioScreen> {
  late final YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(initialVideoId: widget.vedioKey);
  }

  @override
  void deactivate() {
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: _controller,
        bottomActions: [
          const SizedBox(width: 14.0),
          CurrentPosition(),
          const SizedBox(width: 8.0),
          ProgressBar(isExpanded: true, colors: const ProgressBarColors()),
          RemainingDuration(),
          const PlaybackSpeedButton(),
        ],
      ),
      builder: (context, player) {
        return AspectRatio(
          aspectRatio: 16 / 9,
          child: Container(
            color: Theme.of(context).dividerColor,
            child: player,
          ),
        );
      },
    );
  }
}
