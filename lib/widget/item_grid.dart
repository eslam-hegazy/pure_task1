import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ItemGrid extends StatelessWidget {
  const ItemGrid({
    Key? key,
    required this.image,
    required this.title,
    required this.orientation,
  }) : super(key: key);
  final IconData image;
  final String title;
  final Orientation orientation;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(6.w),
      padding: EdgeInsets.all(1.w),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(50.h),
      ),
      child: CircleAvatar(
        backgroundColor: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              image,
              size: orientation == Orientation.portrait ? 10.h : 10.w,
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
