import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rxdart/rxdart.dart';
import 'package:zen8app/app/pages/main/home/home_content.dart';
import 'package:zen8app/app/pages/main/home/home_footer.dart';
import 'package:zen8app/app/pages/main/home/home_vm.dart';
import 'package:zen8app/core/core.dart';
import 'package:zen8app/models/models.dart';
import 'package:zen8app/models/sources/news/news.dart';
import 'package:zen8app/utils/utils.dart';
import 'package:zen8app/router/router.dart';
import 'package:zen8app/widgets/sources/navgation_card.dart';
import 'package:zen8app/widgets/sources/red_dot.dart';
import 'package:zen8app/widgets/widgets.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool isLogin = Session.isLoggedIn;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoadingWidget.builder(
          builder: (context, physics) => SingleChildScrollView(
                child: Column(
                  children: [
                    _buildHeader(),
                    HomeContentPage(),
                    const HomeFooter(),
                  ],
                ),
              )),
    );
  }

  Widget _buildHeader() {
    return Container(
      height: 300,
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 20),
            height: 210,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/home-cover.png'),
                    fit: BoxFit.cover)),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    leading: Image.asset(
                      'assets/logo-app.png',
                      width: 47.25,
                      height: 57.107,
                    ),
                    trailing: Container(
                      width: 44,
                      height: 44,
                      child: Stack(
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              height: 44,
                              width: 44,
                              decoration: BoxDecoration(
                                  color: Colors.white, shape: BoxShape.circle),
                              child: SvgPicture.asset("assets/bell-ring.svg",
                                  width: 24, height: 24, fit: BoxFit.scaleDown),
                            ),
                          ),
                          Positioned(top: 10, right: 10, child: const RedDot())
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: isLogin
                          ? MainAxisAlignment.start
                          : MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                            padding: EdgeInsets.only(left: isLogin ? 20 : 0),
                            child: _buildCenterText()),
                        !isLogin
                            ? TextButton.icon(
                                onPressed: () {
                                  context.router.push(LoginRoute());
                                },
                                style: ButtonStyle(
                                  padding: MaterialStateProperty.all<
                                      EdgeInsetsGeometry>(EdgeInsets.zero),
                                ),
                                icon: Text(
                                  "Đăng nhập",
                                  style: AppTheme.smallTextStyle().copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                                ),
                                label: SvgPicture.asset(
                                    "assets/arrow-circle-right.svg"),
                              )
                            : Container(),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          ),
          Positioned(
              top: 180,
              left: 20,
              right: 20,
              child: NavigationCard(
                isLogin: isLogin,
              )),
        ],
      ),
    );
  }

  Widget _buildCenterText() {
    return RichText(
      text: TextSpan(
        style: const TextStyle(fontSize: 13, color: Color(0XFF8A8A8A)),
        children: <TextSpan>[
          TextSpan(
              text: 'Tuổi trẻ Đà Nẵng ',
              style: AppTheme.largeTextStyle().copyWith(color: Colors.white)),
          TextSpan(
              text: Session.currentUser != null
                  ? '\nXin chào, ${Session.currentUser?.fullName}'
                  : "\n Xin chào, bạn chưa đăng nhập",
              style: AppTheme.smallTextStyle().copyWith(
                color: Colors.white,
                height: 1.5,
              )),
        ],
      ),
    );
  }
}
