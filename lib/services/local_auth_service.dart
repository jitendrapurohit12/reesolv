import 'dart:io';

import 'package:local_auth/local_auth.dart';
import 'package:flutter/services.dart';

class LocalAuthenticationService {
  final _auth = LocalAuthentication();

  bool isProtectionEnabled = false;
  bool isAuthenticated = false;

  Future<bool> authenticate() async {
    List<BiometricType> availableBiometrics =
        await _auth.getAvailableBiometrics();

    if (Platform.isIOS) {
      if (availableBiometrics.contains(BiometricType.face)) {
        isProtectionEnabled = true;
      } else if (availableBiometrics.contains(BiometricType.fingerprint)) {
        isProtectionEnabled = true;
      }
    }

    if (!isProtectionEnabled) return true;

    try {
      isAuthenticated = await _auth.authenticateWithBiometrics(
        localizedReason: 'authenticate to access',
        sensitiveTransaction: true,
        useErrorDialogs: true,
        stickyAuth: true,
      );
      return isAuthenticated;
    } on PlatformException catch (e) {
      print(e);
      return false;
    }
  }
}
