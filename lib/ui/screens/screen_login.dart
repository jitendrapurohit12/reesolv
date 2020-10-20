import 'package:flutter/material.dart';
import 'package:reezolv/constants/constant.dart';
import 'package:reezolv/helper/ui_helper.dart';
import 'package:reezolv/style/styles.dart';
import 'package:reezolv/ui/screens/screen_dashboard.dart';
import 'package:reezolv/validator/validator.dart';

class ScreenLogin extends StatefulWidget {
  static const String id = 'login';
  @override
  _ScreenLoginState createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {
  GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController _emailController, _passwordController;
  String email, password;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController?.dispose();
    _passwordController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox.shrink(),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: kEmail,
                        prefixIcon: Icon(Icons.mail),
                        border: textFieldBorder,
                      ),
                      validator: (s) =>
                          checkValidation(ValidationType.EMAIL, s, kEmail),
                      onSaved: (s) => email = s,
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: kPassword,
                        prefixIcon: Icon(Icons.lock),
                        border: textFieldBorder,
                      ),
                      validator: (s) => checkValidation(
                          ValidationType.NON_EMPTY, s, kPassword),
                      onSaved: (s) => password = s,
                    ),
                    SizedBox(height: 8),
                    Align(
                      alignment: Alignment.centerRight,
                      child: FlatButton(
                        onPressed: () {},
                        child: Text(
                          kForgotPassword,
                          style: Theme.of(context)
                              .textTheme
                              .button
                              .copyWith(color: kColorPrimary),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  width: double.maxFinite,
                  child: getRoundedButton(
                    kLogin.toUpperCase(),
                    () {
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                        Navigator.pushNamed(context, ScreenDashboard.id);
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
