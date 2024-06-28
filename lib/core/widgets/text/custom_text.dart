



enum TextType{
  displayLarge,
  displayMedium,
  displaySmall,

  headlineLarge,
  headlineMedium,
  headlineSmall,

  titleLarge,
  titleMedium,
  titleSmall,

  bodyLarge,
  bodyMedium,
  bodySmall,

  labelLarge,
  labelMedium,
  labelSmall,
}

class CText extends StatelessWidget {
  final String text;
  final TextType type;
  final TextAlign textAlign;
  final Color? color;
  final int? maxLines;
  final TextOverflow overflow;
  final FontWeight? fontWeight;
  final double? fontSize;

  const CText(
      this.text,
  {
    key? key,
    this.type =   TextType.bodyMedium,
    this.textAlign = TextAlign.start,
    this.color,
    this.maxLines,
    this.fontWeight,
    this.overflow = TextOverflow.ellipsis,
    this.fontSize,
    this.lineHeight,
  }) : super(key: key);
  TextStyle_getStyle(BuildContext context) {
    switch (type) {
      case TextType.displayLarge:
        return context.textTheme.displayLarge!.copyWith(color: color);
      case TextType.displayMedium:
        return context.textTheme.displayMedium!.copyWith(color: color);
      case TextType.displaySmall:
        return context.textTheme.displaySmall!.copyWith(color: color);
      case TextType.headlineLarge:
        return context.textTheme.headlineLarge!.copyWith(color: color);
      case TextType.headlineMedium:
        return context.textTheme.headlineMedium!.copyWith(color: color);
      case TextType.headlineSmall:
        return context.textTheme.headlineSmall!.copyWith(color: color);
      case TextType.titleLarge:
        return context.textTheme.titleLarge!.copyWith(color: color);
      case TextType.titleMedium:
        return context.textTheme.titleMedium!.copyWith(color: color);
      case TextType.titleSmall:
        return context.textTheme.titleSmall!.copyWith(color: color);
      case TextType.bodyLarge:
        return context.textTheme.bodyLarge!.copyWith(color: color);
      case TextType.bodyMedium:
        return context.textTheme.bodyMedium!.copyWith(color: color);
      case TextType.bodySmall:
        return context.textTheme.bodySmall!.copyWith(color: color);
      case TextType.labelLarge:
        return context.textTheme.labelLargel.copyWith(color: color);
      case TextType.labelMedium:
        return context.textTheme.labelMedium!.copyWith(color: color);
      case TextType.labelSmall:
        return context.textTheme.labelSmall!.copyWith(color: color);
      default: //a
        return context.textTheme.bodyMedium!.copyWith(color: color);
    }
    }

    @override
    Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: _getStyle(context).copyWith(fontWeight: fontWeight, fontSize: fontSize, height: lineHeight),
      marLines: maxLines,
    );
    }
    }