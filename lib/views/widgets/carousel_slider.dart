import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

Widget buildCarouselSlider({
  required List<String> images,
  double height = 200.0,
  bool autoPlay = true,
  Duration autoPlayInterval = const Duration(seconds: 10),
  Duration autoPlayAnimationDuration = const Duration(milliseconds: 800),
  Curve autoPlayCurve = Curves.fastOutSlowIn,
  Axis scrollDirection = Axis.horizontal,
  void Function(int index, CarouselPageChangedReason reason)? onPageChanged,
  bool isBoxFitcover = false,
  required BuildContext context,
}) {
  final themecolor = Theme.of(context).colorScheme;

  return CarouselSlider(
    options: CarouselOptions(
      height: height,
      autoPlay: autoPlay,
      autoPlayInterval: autoPlayInterval,
      autoPlayAnimationDuration: autoPlayAnimationDuration,
      autoPlayCurve: autoPlayCurve,
      enlargeCenterPage: true,
      scrollDirection: scrollDirection,
      onPageChanged: onPageChanged,
    ),
    items:
        images.map((imageUrl) {
          return Container(
            padding: const EdgeInsets.all(4), // المسافة بين الصورة والإطار
            decoration: BoxDecoration(
              color: themecolor.primary, // لون الإطار الخارجي
              borderRadius: BorderRadius.circular(16), // انحناء الزوايا
              boxShadow: [
                BoxShadow(
                  color: themecolor.primary, // لون الظل
                  blurRadius: 5, // نصف قطر الظل
                  offset: Offset(0, 5), // إزاحة الظل
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12), // انحناء الصورة
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                placeholder:
                    (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                width: double.infinity,
                height: height,
                fit: BoxFit.fill,
              ),
            ),
          );
        }).toList(),
  );
}
