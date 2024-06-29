import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../text/custom_text.dart';

class ReusableButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Gradient? backgroundGradient;
  final TextStyle? textStyle;
  final Color? borderColor;
  final Color? textColor;
  final double? borderWidth;
  final FontWeight? fontWeight;
  final Widget? btnIcon;
  final Widget? suffixIcon;
  final TextType? textType;
  final double? borderRadius;
  final BorderRadius? borderRadiusCust;
  final MainAxisAlignment? alignmentForText;

  const ReusableButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.backgroundColor,
    this.backgroundGradient,
    this.textStyle,
    this.borderColor,
    this.textColor,
    this.borderWidth,
    this.btnIcon,
    this.textType,
    this.fontWeight,
    this.suffixIcon,
    this.borderRadius,
    this.borderRadiusCust,
    this.alignmentForText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
        decoration: BoxDecoration(
          color: backgroundColor ?? AppColors.white,
          // Use white if no color provided
          gradient: backgroundGradient,
          borderRadius:
              borderRadiusCust ?? BorderRadius.circular(borderRadius ?? 12.0),
          border: Border.all(
              color: borderColor ?? Colors.transparent,
              width: borderWidth ?? 2.0), // Add border
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: alignmentForText == null ? 16.0 : 0.0,
                vertical: alignmentForText == null ? 4.0 : 6.0),
            child: Row(
              mainAxisAlignment: alignmentForText ?? MainAxisAlignment.center,
              children: [
                btnIcon ?? const SizedBox.shrink(),
                alignmentForText == null
                    ? SizedBox(width: 8,)
                    : const SizedBox.shrink(),
                CText(
                  text,
                  type: textType ?? TextType.titleSmall,
                  fontWeight: fontWeight ?? FontWeight.w600,
                  color: textColor,
                ),
                SizedBox(
                  width: 8,
                ),
                suffixIcon ?? const SizedBox.shrink()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
