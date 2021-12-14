import 'package:flutter/material.dart';
import 'package:h_shop/app_constants/dimens.dart';

class NormalTextWidget extends StatefulWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final int? maxLines;
  final double lineHeight;
  final TextOverflow? textOverflow;
  final double letterSpacing;
  final TextAlign textAlign;

  const NormalTextWidget(this.text, {
    this.fontSize = TEXT_REGULAR_2X,
    this.fontWeight = FontWeight.w400,
    this.maxLines = 1,
    this.lineHeight =  1.3,
    this.letterSpacing = 0,
    this.textOverflow,
    this.textAlign = TextAlign.center,
    Key? key,
  }) : super(key: key);

  @override
  _NormalTextWidgetState createState() => _NormalTextWidgetState();
}

class _NormalTextWidgetState extends State<NormalTextWidget> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
      overflow: widget.textOverflow,
      maxLines: widget.maxLines,
      textAlign: widget.textAlign,
      style: TextStyle(
          fontSize: widget.fontSize,
          fontWeight: widget.fontWeight,
          height: widget.lineHeight,
          fontFamily: "sarabun",
          letterSpacing: widget.letterSpacing
      ),
    );
  }
}
