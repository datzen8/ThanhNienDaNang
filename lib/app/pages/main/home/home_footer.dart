import 'package:flutter/cupertino.dart';
import 'package:zen8app/widgets/sources/slogan_text.dart';

class HomeFooter extends StatelessWidget {
  const HomeFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SloganText(),
          Image.asset('images/footer-cover.png')
        ],
      ),
    );
  }
}
