import 'package:reezolv/constants/constant.dart';

enum ValidationType { EMAIL, MANDATORY_PHONE, OPTIONAL_PHONE, NON_EMPTY }

bool isValid(ValidationType type, String value) {
  switch (type) {
    case ValidationType.EMAIL:
      return RegExp(kRegexValidateEmail).hasMatch(value);
    case ValidationType.MANDATORY_PHONE:
      return value.length == 10;
    case ValidationType.OPTIONAL_PHONE:
      return value.isEmpty || value.length == 10;
    case ValidationType.NON_EMPTY:
      return value.isNotEmpty && value.trim().length > 2;
    default:
      return true;
  }
}

String checkValidation(ValidationType type, String value, String hint) =>
    isValid(type, value) ? null : 'Invalid $hint!';
