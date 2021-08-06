import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';



class ImageFileUrl extends StatelessWidget {

  final String? imageUrl;
  ImageFileUrl({this.imageUrl});
  @override
  Widget build(BuildContext context) {
    final bool isInvalidImage = (imageUrl != null) ? imageUrl!.startsWith("http") : false;
    final primaryColor = Theme.of(context).primaryColor;
  if(imageUrl == null || imageUrl == "" || !isInvalidImage) {
      return const Icon(Icons.broken_image);
    } else {
      return CachedNetworkImage(
        imageUrl: imageUrl!,
        placeholder: (context, url) => Center(child: CircularProgressIndicator(
          color: primaryColor,
        )),
        errorWidget: (context,url,error) => const Icon(Icons.broken_image),
        fit: BoxFit.cover,
      );

    }
  }
}
