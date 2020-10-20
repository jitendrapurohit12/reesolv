import 'package:flutter/material.dart';
import 'package:reezolv/constants/constant.dart';
import 'package:reezolv/helper/ui_helper.dart';

class IntroUnit extends StatelessWidget {
  final String title, description;
  final int position, totalPages;
  final VoidCallback signupCallback, skipCallback;

  const IntroUnit(
      {Key key,
      this.title,
      this.description,
      this.position,
      this.totalPages,
      this.signupCallback,
      this.skipCallback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SizedBox(),
        Container(height: 250),
        SizedBox(height: 36),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                title,
                style: Theme.of(context).textTheme.headline4,
              ),
              SizedBox(height: 16),
              Text(
                description,
                style: Theme.of(context).textTheme.headline6,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
