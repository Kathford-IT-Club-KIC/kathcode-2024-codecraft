




import 'package:flutter/material.dart';

class ImageSlider extends StatelessWidget {
  const ImageSlider({super.key, this.width, required this.imageName,
  this.fit
  });

  final double? width;
  final String imageName;
  final BoxFit? fit;

  @override
  Widget build (BuildContext context) {
    return Padding (
        padding: const EdgeInsets.all(8.0),
    child: ClipRRect(
    borderRadius: BorderRadius.circular (12.0),
    child: Container (
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(12.0) ), // BoxDecoration
    width: width ?? AppSpacing.screenWidth(context),
    child: Image(fit: BoxFit.fitWidth, image: AssetImage(imageName)),
    ), // Container
    ), );// ClipRRect
}
}