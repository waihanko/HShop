import 'package:flutter/material.dart';


class ShapeItem extends StatefulWidget {
  final Function? onPress;
  final Color color;
  final double boxWidth;
  final double boxHeight;
  final BoxShape boxShape;

  const ShapeItem({
    this.onPress,
    this.boxWidth = 48,
    this.boxHeight = 48,
    this.color = Colors.grey,
    this.boxShape = BoxShape.rectangle,
    Key? key,
  }) : super(key: key);

  @override
  _ShapeItemState createState() => _ShapeItemState();
}

class _ShapeItemState extends State<ShapeItem> {




  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
            color: widget.color,
            shape: widget.boxShape
        ),
        width: widget.boxWidth,
        height: widget.boxHeight,
      ),
      onTap: () => widget.onPress == null ? null : widget.onPress!(),
    );
  }
}
