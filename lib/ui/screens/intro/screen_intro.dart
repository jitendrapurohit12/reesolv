import 'package:flutter/material.dart';
import 'package:reezolv/constants/constant.dart';
import 'package:reezolv/helper/ui_helper.dart';
import 'package:reezolv/models/intro_model.dart';
import 'package:reezolv/ui/screens/intro/intro_unit.dart';
import 'package:reezolv/ui/screens/screen_create_account.dart';
import 'package:reezolv/ui/screens/screen_login.dart';

class ScreenIntro extends StatefulWidget {
  static const id = 'intro';
  @override
  _ScreenIntroState createState() => _ScreenIntroState();
}

class _ScreenIntroState extends State<ScreenIntro>
    with SingleTickerProviderStateMixin {
  TabController _pageController;
  int _position = 0;

  @override
  void initState() {
    _pageController = TabController(length: 3, vsync: this);

    _pageController.addListener(() {
      setState(() {
        _position = _pageController.index;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _pageController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome'),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height - 300,
              child: TabBarView(
                controller: _pageController,
                children: introList
                    .map((e) => IntroUnit(
                          description: e.description,
                          title: e.title,
                          position: introList.indexOf(e),
                          totalPages: 3,
                          signupCallback: () {},
                          skipCallback: () {},
                        ))
                    .toList(),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(height: 56),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    for (int i = 0; i < 3; i++)
                      Container(
                        margin: EdgeInsets.all(8),
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: i <= _position ? kColorPrimary : Colors.grey,
                        ),
                      )
                  ],
                ),
                SizedBox(height: 24),
                Row(
                  children: <Widget>[
                    SizedBox(width: 8),
                    Expanded(
                      child: getRoundedButton(
                        kSkip.toUpperCase(),
                        () => Navigator.pushNamed(
                          context,
                          ScreenLogin.id,
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: getRoundedButton(
                        kSignUp.toUpperCase(),
                        () => Navigator.pushNamed(
                          context,
                          ScreenCreateAccount.id,
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
