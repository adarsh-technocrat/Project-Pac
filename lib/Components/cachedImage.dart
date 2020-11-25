import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:evento/Components/UniversalVariables.dart';

class CachedImage extends StatelessWidget {
  final String imageUrl;
  final bool isRound;
  final double radius;
  final double height;
  final double width;

  final BoxFit fit;

  CachedImage(
    this.imageUrl, {
    this.isRound = false,
    this.radius = 0,
    this.height,
    this.width,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    try {
      return Padding(
        padding: const EdgeInsets.all(10),
        child: SizedBox(
          height: isRound ? radius : height,
          width: isRound ? radius : width,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(isRound ? 50 : radius),
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              fit: fit,
              // placeholder: (context, url) =>
              //     Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => Image.network(
                UniversalVariables.noImageAvailable,
                height: 25,
                width: 25,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      );
    } catch (e) {
      print(e);
      return Image.network(
        UniversalVariables.noImageAvailable,
        height: 25,
        width: 25,
        fit: BoxFit.cover,
      );
    }
  }
}
