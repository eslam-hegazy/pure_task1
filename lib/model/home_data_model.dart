import 'package:flutter/cupertino.dart';

class HomeDataModel {
  final IconData image;
  final String title;
  HomeDataModel({
    required this.image,
    required this.title,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is HomeDataModel &&
        other.image == image &&
        other.title == title;
  }

  @override
  int get hashCode => image.hashCode ^ title.hashCode;
}
