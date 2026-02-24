import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';
import 'dart:io';

class ImageView extends StatelessWidget {
  final String image;
  final Uint8List? videoImage;
  final double? borderRadius;
  final double? height;
  final double? width;
  final double? borderWidth;
  final Color? borderColor;
  final Color? color;
  final BoxFit? fit;
  final String? placeholder;
  final bool isCircle;
  final Gradient? placeGradient;

  const ImageView.circle({
    super.key,
    required this.image,
    this.placeholder,
    this.borderWidth,
    this.borderColor,
    this.width,
    this.height,
    this.color,
    this.fit,
    this.isCircle = true,
    this.borderRadius,
    this.placeGradient,
    this.videoImage,
  });

  const ImageView.rect({
    super.key,
    required this.image,
    this.placeholder,
    this.borderWidth,
    this.borderColor,
    this.color,
    this.width,
    this.height,
    this.fit,
    this.isCircle = false,
    this.borderRadius,
    this.placeGradient,
    this.videoImage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? double.infinity,
      width: width ?? double.infinity,
      decoration: BoxDecoration(
        shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
        borderRadius:
            isCircle ? null : BorderRadius.circular(borderRadius ?? 10),
        border:
            borderWidth != null && borderColor != null
                ? Border.all(
                  color: borderColor ?? Colors.transparent,
                  width: borderWidth ?? 0,
                )
                : null,
      ),
      child: _buildImage(),
    );
  }

  Widget _buildImage() {
    if (videoImage != null) {
      return _videoWidget();
    }

    if (image.isEmpty) {
      return _placeholderWidget();
    }

    if (!image.contains("http")) {
      return _localImageWidget();
    }

    return _networkImageWidget();
  }

  Widget _localImageWidget() {
    return Container(
      height: height ?? double.infinity,
      width: width ?? double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
        borderRadius:
            isCircle ? null : BorderRadius.circular(borderRadius ?? 10),
        image: DecorationImage(
          image: FileImage(File(image)),
          fit: fit ?? BoxFit.cover,
        ),
      ),
    );
  }

  Widget _networkImageWidget() {
    return CachedNetworkImage(
      imageUrl: image,
      imageBuilder: (context, imageProvider) {
        return Container(
          decoration: BoxDecoration(
            color: color ?? Colors.transparent,
            shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
            borderRadius: isCircle ? null : BorderRadius.circular(borderRadius ?? 10),
            image: DecorationImage(
              image: imageProvider,
              fit: fit ?? BoxFit.fill,
            ),
          ),
        );
      },
      placeholder: (context, url) {
        return Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Container(
            height: height ?? double.infinity,
            width: width ?? double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
              borderRadius: isCircle ? null : BorderRadius.circular(borderRadius ?? 10),
            ),
          ),
        );
      },
      errorWidget: (context, url, error) {
        return _placeholderWidget();
      },
    );
  }


  Widget _placeholderWidget() {
    return Container(
      height: height ?? double.infinity,
      width: width ?? double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
        borderRadius:
            isCircle ? null : BorderRadius.circular(borderRadius ?? 10),
        image: DecorationImage(
          image: AssetImage(placeholder ?? "images/profile.png"),
          fit: fit ?? BoxFit.fill,
        ),
      ),
    );
  }

  Widget _videoWidget() {
    return Container(
      height: height ?? double.infinity,
      width: width ?? double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
        borderRadius:
            isCircle ? null : BorderRadius.circular(borderRadius ?? 10),
        image: DecorationImage(
          image: MemoryImage(videoImage!),
          fit: fit ?? BoxFit.contain,
        ),
      ),
    );
  }
}
