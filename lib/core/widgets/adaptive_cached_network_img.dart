import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:main_character/app/colors/app_colors.dart';
import 'package:main_character/app/dimension/design_dimension.dart';

class AdaptiveCachedNetworkImg extends StatelessWidget {
  final String? imageUrl;
  final IconData? iconData;
  final double? iconSize;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final BorderRadius borderRadius;
  final Color? backgroundColor;
  final Color? iconColor;
  const AdaptiveCachedNetworkImg({
    Key? key,
    required this.imageUrl,
    this.iconData = Icons.image,
    this.fit = BoxFit.cover,
    this.borderRadius = BorderRadius.zero,
    this.backgroundColor,
    this.iconSize,
    this.iconColor,
    this.width = 45,
    this.height = 45,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ClipRRect(
        borderRadius: borderRadius == BorderRadius.zero
            ? DDimens.bigRadius.radius
            : borderRadius,
        child: ColoredBox(
          color:
              backgroundColor ?? AppColors.of(context).scaffoldBackground,
          child: _buildImage(context),
        ),
      ),
    );
  }

  Widget _buildImage(BuildContext context) {
    if (imageUrl != null) {
      final formatImage = imageUrl!.substring(imageUrl!.length - 3);
      if (formatImage == "svg") {
        return SvgPicture.network(imageUrl!);
      }
      return CachedNetworkImage(
        imageUrl: imageUrl!,
        fit: fit,
        placeholder: (context, url) {
          return Icon(
            iconData,
            size: iconSize,
            color: iconColor,
          );
        },
        errorWidget: (context, url, error) => Icon(
          iconData,
          size: iconSize,
          color: iconColor,
        ),
      );
    }
    return Icon(
      iconData,
      size: iconSize,
      color: iconColor,
    );
  }
}
