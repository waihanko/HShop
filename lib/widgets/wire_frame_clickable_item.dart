import 'package:flutter/material.dart';

class ClickableWireItem extends StatefulWidget {
  final Function? onPress;
  final double width;
  final double height;
  final Color color;

  const ClickableWireItem({
    this.onPress,
    this.width = 80,
    this.height = 60,
    this.color = Colors.white30,
    Key? key,
  }) : super(key: key);

  @override
  _ClickableWireItemState createState() => _ClickableWireItemState();
}

class _ClickableWireItemState extends State<ClickableWireItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: widget.width,
        height: widget.height,
        color: widget.color,
      ),
      onTap: () => widget.onPress == null ? null : widget.onPress!(),
    );
  }
}
