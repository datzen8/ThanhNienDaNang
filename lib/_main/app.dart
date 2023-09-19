import 'dart:io';

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:zen8app/core/core.dart';
import 'package:zen8app/router/router.dart';
import 'package:zen8app/utils/utils.dart';

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}
class Zen8app extends StatefulWidget {
  const Zen8app({Key? key}) : super(key: key);

  static Future<void> load(Env env) async {
    HttpOverrides.global = MyHttpOverrides();
    WidgetsFlutterBinding.ensureInitialized();
    Config.currentEnv = env;
    registerDependencies();
    await Session.initialize();
    runApp(const Zen8app());
  }

  @override
  State<Zen8app> createState() => _Zen8appState();
}

class _Zen8appState extends State<Zen8app> {
  final _appRouter = AppRouter();
  final _rxBag = CompositeSubscription();
  @override
  void initState() {
    super.initState();
    EventBus.shared
        .get<String>(AppEvent.forceLogout).delay(Duration(milliseconds: 300))
        .listen(_logout)
        .addTo(_rxBag);

    EventBus.shared
        .get<String>(AppEvent.showAuthDialog).
        listen(_logout)
        .addTo(_rxBag);
  }

  @override
  void dispose() {
    super.dispose();
    _rxBag.dispose();
  }

  Future<void> _logout(String reason) async {
    print("----- Force logout reason: $reason");
    await Session.endAuthenticatedSession();
    await _appRouter.replaceAll([const HomeRoute(), const LoginRoute()],updateExistingRoutes: false);
  }



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      child: MaterialApp.router(
        title: "Flutter demo",
        theme: defaultThemeData(),
        routerConfig: _appRouter.config(),
      ),
    );
  }
}
