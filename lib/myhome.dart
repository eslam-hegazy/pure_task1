import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pure_task1/data/carousel_data.dart';
import 'package:pure_task1/data/home_data.dart';
import 'package:pure_task1/widget/carsual_item.dart';
import 'package:pure_task1/widget/item_grid.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MyHome extends StatelessWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: ((context, orientation) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            "الرئيسية",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.language),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.ac_unit_outlined),
            ),
          ],
        ),
        body: Column(
          children: [
            SizedBox(height: 3.h),
            CarouselSlider(
              items: carsualData.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return CarousalItem(image: i);
                  },
                );
              }).toList(),
              options: CarouselOptions(
                height: orientation == Orientation.portrait ? 12.h : 20.h,
                aspectRatio: 16 / 9,
                viewportFraction: 0.8,
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
            ),
            SizedBox(height: 3.h),
            Expanded(
              child: GridView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: homeData.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount:
                        (orientation == Orientation.portrait) ? 2 : 3),
                itemBuilder: (BuildContext context, int index) {
                  return ItemGrid(
                    image: homeData[index].image,
                    title: homeData[index].title,
                    orientation: orientation,
                  );
                },
              ),
            )
          ],
        ),
      );
    }));
  }
}
