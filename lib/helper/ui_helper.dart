import 'package:flutter/material.dart';
import 'package:reezolv/constants/constant.dart';

Widget getRoundedButton(String label, VoidCallback callback) {
  return RaisedButton(
    padding: EdgeInsets.all(12),
    color: kColorPrimary,
    onPressed: callback,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    child: Text(
      label,
      style: TextStyle(
        color: Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
