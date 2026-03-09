import 'package:flutter/material.dart';

class PageViewItemModel {
  final String subTitle;
  final Widget title;
  final String image, backgroundImage;

  PageViewItemModel({
    required this.subTitle,
    required this.title,
    required this.image,
    required this.backgroundImage,
  });
}
