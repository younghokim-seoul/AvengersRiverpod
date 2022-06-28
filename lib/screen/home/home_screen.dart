import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_sample/main.dart';
import 'package:riverpod_sample/resources/app_icons.dart';
import 'package:riverpod_sample/resources/app_styles.dart';
import 'package:riverpod_sample/screen/detail/detail_screen.dart';
import 'package:riverpod_sample/screen/home/home_provider.dart';
import 'package:riverpod_sample/screen/widget/load_asset.dart';
import 'package:riverpod_sample/screen/widget/loading_indicator.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  loadAsset(AppIcons.stream, width: 160, height: 30),
                  loadAsset(AppIcons.marvel, width: 160, height: 30),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 32),
              child: const Text(
                "Choose your hero",
                style: AppStyles.bold32,
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(child: Consumer(
              builder: (context, ref, child) {
                final avengersResponse = ref.watch(avengersListProvider);
                final double height = MediaQuery.of(context).size.height;
                return avengersResponse.when(
                  error: (error, stackTrace) {
                    logger.e("::::::::::error $error");
                    return const LoadingIndicator();
                  },
                  loading: () {
                    logger.i(":::::::::::loading");
                    return const LoadingIndicator();
                  },
                  data: (avengers) {
                    logger.i(":::::::data");
                    return CarouselSlider(
                      options: CarouselOptions(
                        autoPlay: false,
                        height: height,
                        enlargeCenterPage: true,
                      ),
                      items: avengers
                          .map(
                            (e) => Card(
                              clipBehavior: Clip.antiAlias,
                              child: InkWell(
                                onTap: () {
                                  logger.i(":::::::::::클릭... $e");
                                  Navigator.pushNamed(
                                    context,
                                    DetailScreen.routeName,
                                    arguments: e,
                                  );
                                },
                                child: CachedNetworkImage(
                                  imageBuilder: (context, imageProvider) =>
                                      Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  placeholder: (context, url) => const Center(
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                    ),
                                  ),
                                  imageUrl: e.poster,
                                  fit: BoxFit.cover,
                                  height: height,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    );
                  },
                );
              },
            )),
          ],
        ),
      ),
    );
  }
}
