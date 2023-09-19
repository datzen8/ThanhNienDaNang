import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:zen8app/core/core.dart';

class FacebookLaunch extends StatelessWidget {
  const FacebookLaunch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 16),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/launch_facebook_background_image.png",),
            fit: BoxFit.fitWidth
          ),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppTheme.greyColor, width: 1)),
      child: Row(
        children: [
          Image.asset(
            "images/facebook_logo.png",
            height: 40,
            fit: BoxFit.fitHeight,
          ),
          Column(
            children: [
              launchButton()
            ],
          )
        ],
      ),
    );
  }

  Widget launchButton(){
    return GestureDetector(
      onTap: (){
        _launchURL('https://www.zen8labs.com/');
      },
      child: Row(
        children: [
          Text("Tham gia ngay")
        ],
      ),
    );
  }

  void _launchURL(String url) async {
    try {
      bool launched =
      await launchUrlString(url, mode: LaunchMode.externalApplication);

      if (!launched) {
        await launchUrlString(url,
            mode: LaunchMode.externalNonBrowserApplication);
      }
    } catch (e) {
      await launchUrlString(url,
          mode: LaunchMode.externalNonBrowserApplication);
    }
  }
}
