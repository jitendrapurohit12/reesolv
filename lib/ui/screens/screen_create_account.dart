import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reezolv/helper/ui_helper.dart';
import 'package:reezolv/services/firebase_auth_service.dart';
import 'package:reezolv/style/styles.dart';
import 'package:reezolv/ui/common/basic_scaffold.dart';
import 'package:reezolv/constants/constant.dart';
import 'package:reezolv/ui/screens/screen_dashboard.dart';
import 'package:reezolv/validator/validator.dart';

class ScreenCreateAccount extends StatefulWidget {
  static const id = 'create account';

  @override
  _ScreenCreateAccountState createState() => _ScreenCreateAccountState();
}

class _ScreenCreateAccountState extends State<ScreenCreateAccount> {
  GlobalKey<FormState> _formKey = GlobalKey();
  StreamController<String> _errorController = StreamController();
  TextEditingController _firstNameController,
      _lastNameController,
      _emailController,
      _phoneController;
  bool _isTAndCEnabled = false;
  String firstName, lastName, email, phone;

  @override
  void initState() {
    super.initState();
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
    _emailController = TextEditingController();
    _phoneController = TextEditingController();
  }

  @override
  void dispose() {
    _firstNameController?.dispose();
    _lastNameController?.dispose();
    _emailController?.dispose();
    _phoneController?.dispose();
    _errorController?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BasicScaffold(
      appBar: AppBar(
        title: Text('Create Account'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: <Widget>[
                SizedBox(height: 24),
                TextFormField(
                  controller: _firstNameController,
                  decoration: InputDecoration(
                    labelText: kFirstName,
                    prefixIcon: Icon(Icons.person),
                    border: textFieldBorder,
                  ),
                  validator: (s) =>
                      checkValidation(ValidationType.NON_EMPTY, s, kFirstName),
                  onSaved: (s) => firstName = s,
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _lastNameController,
                  decoration: InputDecoration(
                    labelText: kLastName,
                    prefixIcon: Icon(Icons.person),
                    border: textFieldBorder,
                  ),
                  validator: (s) =>
                      checkValidation(ValidationType.NON_EMPTY, s, kLastName),
                  onSaved: (s) => lastName = s,
                ),
                SizedBox(height: 16),
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
                  controller: _phoneController,
                  keyboardType: TextInputType.numberWithOptions(decimal: false),
                  maxLength: 10,
                  decoration: InputDecoration(
                    labelText: kPhone,
                    prefixIcon: Icon(Icons.phone),
                    prefix: Text('+91'),
                    border: textFieldBorder,
                    counterText: '',
                    counterStyle: TextStyle(fontSize: 0),
                  ),
                  validator: (s) => checkValidation(
                      ValidationType.MANDATORY_PHONE, s, kPhone),
                  onSaved: (s) => phone = s,
                ),
                SizedBox(height: 16),
                ListTile(
                  contentPadding: EdgeInsets.symmetric(vertical: 8),
                  onTap: () =>
                      setState(() => _isTAndCEnabled = !_isTAndCEnabled),
                  title: Text(kTandC),
                  leading: Checkbox(
                    value: _isTAndCEnabled,
                    onChanged: (b) => setState(() => _isTAndCEnabled = b),
                  ),
                ),
                SizedBox(height: 48),
                SizedBox(
                  width: double.maxFinite,
                  child: getRoundedButton(
                    kSignUp.toUpperCase(),
                    _isTAndCEnabled
                        ? () {
                            if (_formKey.currentState.validate()) {
                              _formKey.currentState.save();
                              FirebaseAuth auth = FirebaseAuth.instance;
                              auth.verifyPhoneNumber(
                                  phoneNumber: phone,
                                  timeout: Duration(seconds: 5),
                                  verificationCompleted: (AuthCredential cred) {
                                    print('successfully verified');
                                    print(cred);
                                  },
                                  verificationFailed: (e) => _errorController
                                      .add(((e as PlatformException).message)),
                                  codeSent: (id, [token]) {
                                    print('code sent id: $id');
                                    print('code sent token: $token');
                                  },
                                  codeAutoRetrievalTimeout: (s) {
                                    print('codeAutoRetrievalTimeout');
                                    print(s);
                                  });
                            }
                          }
                        : null,
                  ),
                ),
                SizedBox(height: 16),
                SizedBox(
                  width: double.maxFinite,
                  child: getRoundedButton(
                    kSignInWithGoogle.toUpperCase(),
                    () => FirebaseAuthService().signInWithGoogle((s) {
                      if (s == null)
                        _errorController.add((s as PlatformException).message);
                      else {
                        Navigator.pushNamed(context, ScreenDashboard.id);
                      }
                    }),
                  ),
                ),
                SizedBox(height: 36),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
