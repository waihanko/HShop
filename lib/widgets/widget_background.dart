import 'package:flutter/material.dart';
import 'package:h_shop/app_constants/dimens.dart';

class BackgroundWidget extends StatelessWidget {
  final Widget? child;
  final Color? color;

  const BackgroundWidget({this.child, this.color = Colors.black12, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: MARGIN_MEDIUM,
        vertical: MARGIN_SMALL,
      ),
      child: child,
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(
          Radius.circular(
            MARGIN_CARD_MEDIUM,
          ),
        ),
      ),
    );
  }
}
