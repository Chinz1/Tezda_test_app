import 'package:flutter/material.dart';
import 'package:tezda_app/utils/config/colour_config.dart';
import 'package:tezda_app/utils/const.dart';

class ButtonOutlined extends StatelessWidget {
  final Widget child;
  final void Function() onTap;
  final Color? borderColour;
  const ButtonOutlined({
    super.key,
    required this.child,
    required this.onTap,
    this.borderColour,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: appBorderRadius,
        splashColor: ColourConfig.opaqueAppColour,
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: paddingSize * 2),
          decoration: BoxDecoration(
            border: Border.all(
              color: borderColour ?? ColourConfig.defaultAppColour,
              width: borderWidth,
            ),
            borderRadius: appBorderRadius,
          ),
          child: Center(child: child),
        ),
      ),
    );
  }
}