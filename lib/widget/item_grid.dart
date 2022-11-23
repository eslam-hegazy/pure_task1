import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'dart:io';

class ItemGrid extends StatelessWidget {
  ItemGrid({
    Key? key,
    required this.image,
    required this.title,
    required this.orientation,
  }) : super(key: key);
  final String image;
  final String title;
  final Orientation orientation;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(3.w),
      padding: EdgeInsets.all(1.w),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(50.h),
      ),
      child: CircleAvatar(
        radius: orientation == Orientation.portrait ? 8.h : 8.w,
        backgroundColor: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: Image.file(File(image)).image,
              radius: orientation == Orientation.portrait ? 5.h : 5.w,
            ),
            Text(
              title,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.sp),
            ),
          ],
        ),
      ),
    );
  }
}
