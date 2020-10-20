import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reezolv/constants/constant.dart';
import 'package:reezolv/services/firebase_auth_service.dart';
import 'package:reezolv/ui/screens/auth_widget.dart';
import 'package:reezolv/ui/screens/auth_widget_builder.dart';
import 'package:reezolv/ui/screens/intro/screen_intro.dart';
import 'package:reezolv/ui/screens/screen_create_account.dart';
import 'package:reezolv/ui/screens/screen_dashboard.dart';
import 'package:reezolv/ui/screens/screen_login.dart';
import 'package:reezolv/ui/screens/screen_profile.dart';

import 'ui/screens/screen_home.dart';

void main() => runApp(ReezolvApp());

class ReezolvApp extends StatefulWidget {
  @override
  _ReezolvAppState createState() => _ReezolvAppState();
}

class _ReezolvAppState extends State<ReezolvApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<FirebaseAuthService>(
          create: (_) => FirebaseAuthService(),
        )
      ],
      child: AuthWidgetBuilder(
        builder: (context, userSnapshot) {
          return MaterialApp(
            theme: ThemeData(
              primaryColor: kColorPrimary,
            ),
            initialRoute: AuthWidget.id,
            routes: {
              AuthWidget.id: (_) => AuthWidget(userSnapshot: userSnapshot),
              ScreenHome.id: (_) => ScreenHome(),
              ScreenIntro.id: (_) => ScreenIntro(),
              ScreenCreateAccount.id: (_) => ScreenCreateAccount(),
              ScreenLogin.id: (_) => ScreenLogin(),
              ScreenProfile.id: (_) => ScreenProfile(),
              ScreenDashboard.id: (_) => ScreenDashboard()
            },
          );
        },
      ),
    );
  }
}
