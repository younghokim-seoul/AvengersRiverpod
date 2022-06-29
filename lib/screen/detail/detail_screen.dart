import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_sample/data/network/model/avengers/avengers.dart';
import 'package:riverpod_sample/extension/photo_extension.dart';
import 'package:riverpod_sample/resources/app_styles.dart';
import 'package:riverpod_sample/route/app_route.dart';


class DetailScreen extends ConsumerWidget {
  const DetailScreen({Key? key, required this.avengers}) : super(key: key);
  static const routeName = '/detail';

  final Avengers avengers;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [_posterBuild(context, ref), _vedioBuild(context, ref)],
          ),
        ),
      ),
    );
  }

  Widget _posterBuild(BuildContext context, WidgetRef ref) {
    return Stack(
      children: [
        AspectRatio(
          aspectRatio: 9 / 12,
          child: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              colors: [Color(0x50000000), Color(0x00000000)],
              begin: Alignment.centerRight,
              end: Alignment.bottomRight,
            )),
            child: CachedNetworkImage(
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              imageUrl: avengers.poster,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              margin: const EdgeInsets.only(left: 22),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    avengers.name,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w800,
                        fontSize: 36,
                        color: Colors.white),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    avengers.quote,
                    style: Theme.of(context).textTheme.subtitle1?.copyWith(
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                        color: Colors.white),
                  ),
                  const SizedBox(height: 26),
                ],
              )),
        ),
      ],
    );
  }

  Widget _vedioBuild(BuildContext context, WidgetRef ref) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Featured Live', style: AppStyles.bold19),
          const SizedBox(height: 8),
          InkWell(
            onTap: () {
              context.router.push(VedioScreen(vedioKey: avengers.video));
            },
            child: Stack(
              children: [
                Card(
                  color: Colors.white,
                  elevation: 4,
                  clipBehavior: Clip.antiAlias,
                  child: SizedBox(
                    width: 170,
                    height: 95,
                    child: CachedNetworkImage(
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      imageUrl: avengers.video.getYoutubeThumbnailPath(),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  margin: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.all(Radius.circular(4))),
                  padding: const EdgeInsets.only(
                      left: 10, right: 10, top: 2, bottom: 2),
                  child: Text(
                    'Live',
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2
                        ?.copyWith(fontSize: 12, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
