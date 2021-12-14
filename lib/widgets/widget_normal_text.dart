import 'package:flutter/material.dart';
import 'package:h_shop/app_constants/dimens.dart';

class NormalTextWidget extends StatefulWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;


  const NormalTextWidget(this.text, {
    this.fontSize = TEXT_REGULAR,
    this.fontWeight = FontWeight.w400,
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
      style: TextStyle(
          fontSize: widget.fontSize,
          fontWeight: widget.fontWeight,
          fontFamily: "sarabun",
      ),
    );
  }
}
