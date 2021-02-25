import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:octo_image/octo_image.dart';

class CustomNetworkImage extends StatelessWidget {
  final String netwokImage;
  final String errorImage;

  CustomNetworkImage({this.netwokImage, this.errorImage});

  @override
  Widget build(BuildContext context) {
    return OctoImage(

      image: CachedNetworkImageProvider(
          netwokImage,
      ),
      placeholderBuilder: OctoPlaceholder.blurHash(
        'LEHV6nWB2yk8pyo0adR*.7kCMdnj',
      ),
      errorBuilder: (context, url, error) {
        return Image.asset(errorImage);
      },
      width: double.infinity,
      height: double.infinity,
      fit: BoxFit.fill,
    );
  }
}
