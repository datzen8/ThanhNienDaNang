import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:zen8app/router/router.dart';

class ViewPhotoWrap extends StatelessWidget {
  final Widget child;
  final String imageUrl;
  const ViewPhotoWrap({Key? key, required this.child, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        context.router.push(PhotoViewContainerRoute(imageUrl: imageUrl));
      },
      child: child,
    );
  }
}
