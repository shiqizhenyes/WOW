import 'package:flutter/cupertino.dart';

class WidgetModel {
  WidgetModel({
    @required this.image,
    @required this.title,
    @required this.subtitle,
  });

  final String title;
  final String subtitle;
  final String image;
}
