import 'package:flutter/material.dart';
import 'package:h_shop/app_constants/dimens.dart';

class TitleTextWidget extends StatelessWidget {
  final String text;
  final Color textColor;
  final double fontSize;

  const TitleTextWidget(
    this.text, {
    this.textColor = Colors.black,
    this.fontSize = TEXT_REGULAR_2X,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: TextOverflow.fade,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w600,
        color: textColor,
        fontFamily: "Sarabun",
      ),
    );
  }
}
