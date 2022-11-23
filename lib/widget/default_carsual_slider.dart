import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pure_task1/widget/carsual_item.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../data/carousel_data.dart';

class DefaultCursualSlider extends StatelessWidget {
  final Orientation orientation;
  const DefaultCursualSlider({
    Key? key,
    required this.orientation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: carsualData.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return CarousalItem(image: i);
          },
        );
      }).toList(),
      options: CarouselOptions(
        height: orientation == Orientation.portrait ? 12.h : 25.h,
        aspectRatio: 16 / 9,
        viewportFraction: orientation == Orientation.portrait ? 0.8 : 0.5,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
