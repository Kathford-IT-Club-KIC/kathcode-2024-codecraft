





import 'dart:core';

import 'package:flutter/material.dart';
import 'package:hackathon_easyghar/core/constants/app_assets.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  final String? imageUrl;
  final BoxFit? fitStatus;
  final String? errorImage;
  final double? size;

  const CustomCachedNetworkImage({
    Key? key,
    required this.imageUrl,
    this.size,
    this.fitStatus,
    this.errorImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: CachedNetworkImage(
        height: size,
        width: size,
        imageUrl: imageUrl ?? '',
        fit: fitStatus ?? BoxFit.fill,
        placeholder: (context, url) =>
        const Center(child: CircularProgressIndicator()),
        errorWidget: (context, url, error)=> ClipRRect(
      child: Image.asset(
      errorImage ?? AppAssets.errorImage,
        height: size,
        width: size,
        fit: fitStatus ?? BoxFit.fill,
      ),
    ),
    ),
    );
  }
}
