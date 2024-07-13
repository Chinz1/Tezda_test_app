import 'package:flutter/material.dart';
import 'package:tezda_app/utils/config/colour_config.dart';
import 'package:tezda_app/utils/const.dart';

class Button extends StatelessWidget {
  final Widget child;
  final void Function() onTap;
  final double? padding;
  const Button({
    super.key,
    required this.child,
    required this.onTap,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: appBorderRadius,
        splashColor: ColourConfig.blackColour,
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: paddingSize * 2),
          decoration: BoxDecoration(
            color: ColourConfig.defaultAppColour.withOpacity(.9),
            borderRadius: appBorderRadius,
          ),
          child: Center(child: child),
        ),
      ),
    );
  }
}
