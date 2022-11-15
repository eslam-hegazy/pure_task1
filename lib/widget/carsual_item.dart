import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CarousalItem extends StatelessWidget {
  const CarousalItem({
    Key? key,
    required this.image,
  }) : super(key: key);
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2.h),
        image: DecorationImage(
          image: NetworkImage(image),
          fit: BoxFit.fill,
        ),
        color: Colors.amber,
      ),
    );
  }
}
