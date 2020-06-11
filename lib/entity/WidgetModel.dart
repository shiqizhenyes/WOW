import 'package:flutter/cupertino.dart';

// 没有找到修改美剧类型值的方法
enum WidgetNames {
  Introducing,
  SafeArea,
  Expanded,
  Wrap,
  AnimatedContainer,
  AboutDialog, // 这里是83
}

class WidgetModel {
  WidgetModel({
    @required this.widgetNames,
    @required this.subtitle,
  });

  // 使用get方法来省略两个值的存储
  final WidgetNames widgetNames;
  final String subtitle;

  String get title {
    // 第一个的标题有点长，特殊处理
    switch (widgetNames.index) {
      case 0:
        return "Introducing Widget of the Week!";
        break;
      default:
        return widgetNames.toString().split('.').last;
    }
  }

  String get image {
    int i = widgetNames.index;

    // 计算偏移量
    if (i >= WidgetNames.AboutDialog.index) {
      i += 83 - WidgetNames.AboutDialog.index;
    }

    // 格式化为三位数字+控件名
    String s = i.toString();
    s = "0" * (3 - s.length) + s;
    return "assets/images/$s${widgetNames.toString().split('.').last}.webp";
  }
}
