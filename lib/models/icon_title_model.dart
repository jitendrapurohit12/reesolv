import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IconTitleModel {
  String title;
  IconData icon;
  Color iconColor;

  IconTitleModel({this.icon, this.iconColor, this.title});
}

List<IconTitleModel> iconTitleList = [
  IconTitleModel(
      icon: Icons.monetization_on, iconColor: Colors.green, title: 'Request'),
  IconTitleModel(icon: Icons.payment, iconColor: Colors.amber, title: 'Pay'),
  IconTitleModel(
      icon: FontAwesomeIcons.circle, iconColor: Colors.purple, title: 'Circle'),
  IconTitleModel(
      icon: FontAwesomeIcons.signOutAlt,
      iconColor: Colors.blueAccent,
      title: 'Cash Out'),
  IconTitleModel(icon: Icons.flag, iconColor: Colors.yellow, title: 'Goal'),
  IconTitleModel(
      icon: FontAwesomeIcons.invision, iconColor: Colors.cyan, title: 'Invest'),
];
