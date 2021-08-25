import 'package:flutter/material.dart';

import '../../core/assets/images.dart';

class ImageContainer extends StatelessWidget {
  final double? height;
  final double? width;
  final double? radius;
  final String? assets; /// This is for  local Asset
  final String? url;/// This one is for Network Image,
  final BoxFit? fit;
//  final

  ImageContainer({this.height, this.width, this.assets = ImagesPath.phone_vector,
    this.radius = 0,
    this.url,
    this.fit = BoxFit.contain,
  });
  @override
  Widget build(BuildContext context) {
    return
      url == null ?
      Container(
        height: this.height,
        width: this.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius!),
            image: DecorationImage(
              image: AssetImage(this.assets!),
              fit: fit,
            )
        ),
      ) : ClipRRect(
        borderRadius: BorderRadius.circular(radius!),
        child: FadeInImage(
          width: this.width,
          height: this.height,
          image: NetworkImage(url!),
          placeholder: AssetImage(this.assets!),
          fit: BoxFit.cover,
        ),
      );
  }
}
