import 'package:flutter/material.dart';
import 'package:reezolv/models/icon_title_model.dart';
import 'package:reezolv/style/styles.dart';
import 'package:reezolv/ui/common/icon_title_unit.dart';

class ScreenProfile extends StatefulWidget {
  static const id = 'profile';
  @override
  _ScreenProfileState createState() => _ScreenProfileState();
}

class _ScreenProfileState extends State<ScreenProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              IconButton(
                                  icon: Icon(
                                    Icons.history,
                                    size: 36,
                                  ),
                                  onPressed: () {}),
                              IconButton(
                                  icon: Icon(
                                    Icons.notifications,
                                    size: 36,
                                  ),
                                  onPressed: () {}),
                            ],
                          ),
                          CircleAvatar(
                            radius: 56,
                            child: Icon(
                              Icons.person,
                              size: 52,
                            ),
                          ),
                          Text('Jitendra Purohit',
                              style: Theme.of(context).textTheme.headline4)
                        ],
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      decoration: containerDecoration,
                      padding: EdgeInsets.all(6),
                      child: Center(
                        child: Text('\$100.0',
                            style: Theme.of(context).textTheme.headline4),
                      ),
                    ),
                    SizedBox(height: 36),
                  ],
                ),
              ),
              SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 1.3,
                ),
                delegate: SliverChildBuilderDelegate((context, index) {
                  return Center(
                    child: IconTitleUnit(model: iconTitleList[index]),
                  );
                }, childCount: iconTitleList.length),
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
