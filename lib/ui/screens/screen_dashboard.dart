import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:reezolv/helper/ui_helper.dart';
import 'package:reezolv/style/styles.dart';
import 'package:reezolv/ui/common/basic_scaffold.dart';
import 'package:reezolv/constants/constant.dart';
import 'package:reezolv/ui/screens/screen_home.dart';
import 'package:reezolv/ui/screens/screen_profile.dart';

class ScreenDashboard extends StatefulWidget {
  static const id = 'dashboard';
  @override
  _ScreenDashboardState createState() => _ScreenDashboardState();
}

class _ScreenDashboardState extends State<ScreenDashboard> {
  @override
  Widget build(BuildContext context) {
    return BasicScaffold(
      appBar: AppBar(
        title: Text('My Circles'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.notifications), onPressed: () {}),
          IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Navigator.pushNamedAndRemoveUntil(
                    context, ScreenHome.id, (_) => false);
              })
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: CustomScrollView(
            slivers: <Widget>[
              SliverToBoxAdapter(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      decoration: containerDecoration,
                      padding: EdgeInsets.all(16),
                      height: 280,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () =>
                                Navigator.pushNamed(context, ScreenProfile.id),
                            child: CircleAvatar(
                              radius: 56,
                              child: Icon(
                                Icons.person,
                                size: 52,
                              ),
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text('Sorry you don\'t have any circle yet!',
                                  style: Theme.of(context).textTheme.headline6),
                              SizedBox(height: 8),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Expanded(
                                    child: getRoundedButton(
                                      kJoinCircle,
                                      () {},
                                    ),
                                  ),
                                  SizedBox(width: 16),
                                  Expanded(
                                    child: getRoundedButton(
                                      kCreateCircle,
                                      () {},
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          child: getRoundedButton(
                            kInvest,
                            () {},
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: getRoundedButton(
                            kConnectPayment,
                            () {},
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 36,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
