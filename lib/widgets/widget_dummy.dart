import 'package:flutter/material.dart';
import 'package:h_shop/app_constants/dimens.dart';

class DummyWidget extends StatefulWidget {
  final Function? onPress;
  final Color color;
  final double boxWidth;
  final double boxHeight;
  final BoxShape boxShape;
  final Widget? child;

  const DummyWidget({
    this.onPress,
    this.boxWidth = 48,
    this.boxHeight = 48,
    this.color = Colors.grey,
    this.boxShape = BoxShape.rectangle,
    this.child,
    Key? key,
  }) : super(key: key);

  @override
  _DummyWidgetState createState() => _DummyWidgetState();
}

class _DummyWidgetState extends State<DummyWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          color: widget.color,
          shape: widget.boxShape,
          borderRadius: const BorderRadius.all(
            Radius.circular(MARGIN_MEDIUM),
          ),
        ),
        width: widget.boxWidth,
        height: widget.boxHeight,
        child: widget.child ?? const SizedBox(),
      ),
      onTap: () => widget.onPress == null ? null : widget.onPress!(),
    );
  }
}
