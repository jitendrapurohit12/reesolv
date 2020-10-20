import 'package:flutter/material.dart';
import 'package:reezolv/models/icon_title_model.dart';

class IconTitleUnit extends StatelessWidget {
  final IconTitleModel model;

  const IconTitleUnit({Key key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () {},
      child: Container(
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Icon(
                  model.icon,
                  size: 32,
                  color: model.iconColor,
                ),
              ),
            ),
            SizedBox(height: 8),
            Text(model.title, style: Theme.of(context).textTheme.headline5)
          ],
        ),
      ),
    );
  }
}
