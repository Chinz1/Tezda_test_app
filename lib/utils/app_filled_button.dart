import 'package:flutter/material.dart';
import 'package:tezda_app/utils/theme.dart';
// import 'package:pixel_dat_test_app/utils/dimensions.dart';

class AppFilledButton extends StatelessWidget {
  const AppFilledButton({
    Key? key,
    this.buttonColor,
    this.onPressed,
    this.isOutlined = false,
    this.borderColor,
    this.textColor,
    required this.buttonText,
    this.height = 45,
    this.width,
    this.tapTargetSize,
  }) : super(key: key);

  final Function()? onPressed;
  final String buttonText;
  final Color? buttonColor;
  final Color? borderColor;
  final Color? textColor;
  final bool isOutlined;
  final double height;
  final double? width;
  final MaterialTapTargetSize? tapTargetSize;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor ?? appColors.purple,
        elevation: 0,
        side: isOutlined
            ? BorderSide(
                color: borderColor ?? appColors.purple,
              )
            : BorderSide.none,
        minimumSize: Size(250 ?? double.infinity, 50),
        tapTargetSize: tapTargetSize,
      ),
      onPressed: onPressed,
      child: Text(
        buttonText,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w600,
          color: textColor ?? appColors.white,
        ),
      ),
    );
  }
}
