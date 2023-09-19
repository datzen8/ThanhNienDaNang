import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:photo_view/photo_view.dart';
import 'package:zen8app/widgets/sources/default_network_image.dart';

@RoutePage()
class PhotoViewContainerPage extends StatelessWidget {
  final String imageUrl;
  const PhotoViewContainerPage({Key? key, required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [

            PhotoView(
                imageProvider: CachedNetworkImageProvider(
              imageUrl,
            )),  Positioned(
              child: GestureDetector(
                onTap: (){
                  context.router.pop();
                },
                child: Container(
                  height: 32,
                  width: 32,
                  decoration:
                  BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                  child: SvgPicture.asset("assets/close.svg",
                      width: 11.2, height: 11.2, fit: BoxFit.scaleDown),
                ),
              ),
              top: 10,
              right: 10,
            ),
          ],
        ),
      ),
    );
  }
}
