import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:reezolv/constants/constant.dart';
import 'package:reezolv/helper/ui_helper.dart';
import 'package:reezolv/services/local_auth_service.dart';
import 'package:reezolv/ui/common/basic_scaffold.dart';
import 'package:reezolv/ui/screens/intro/screen_intro.dart';
import 'package:reezolv/ui/screens/screen_login.dart';

class ScreenHome extends StatefulWidget {
  static const id = 'home';
  @override
  _ScreenHomeState createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  bool _gettingAuth = true, _authSuccess = false;

  @override
  void initState() {
    if (kReleaseMode)
      getAuth();
    else {
      _gettingAuth = false;
      _authSuccess = true;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return getBody();
  }

  Widget getBody() {
    if (_gettingAuth) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    if (_authSuccess) {
      return BasicScaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox.shrink(),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Image.asset(
                      kImageLogo,
                      width: 150,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(height: 24),
                    Text(
                      kAppDesc,
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    SizedBox(height: 4),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    getRoundedButton(
                      kStart.toUpperCase(),
                      () => Navigator.pushNamed(
                        context,
                        ScreenIntro.id,
                      ),
                    ),
                    SizedBox(height: 16),
                    getRoundedButton(
                      kLogin.toUpperCase(),
                      () => Navigator.pushNamed(
                        context,
                        ScreenLogin.id,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      );
    }

    return Center(
      child: Text(
        'Please Authnticate Reezolv to continue!',
        style: Theme.of(context).textTheme.headline4,
      ),
    );
  }

  Future<void> getAuth() async {
    _authSuccess = await LocalAuthenticationService().authenticate();
    _gettingAuth = false;
    setState(() {});
  }
}
