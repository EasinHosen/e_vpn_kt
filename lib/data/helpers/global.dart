import 'package:logger/logger.dart';

final globalLogger = Logger();

loggerDebug(String? message, dynamic data) {
  return globalLogger.log(Level.debug, message, error: data);
}

loggerError(String? message, dynamic data) {
  return globalLogger.log(Level.error, message, error: data);
}

// String getFormattedDateTime(DateTime dateTime, String pattern) =>
//     DateFormat(pattern).format(dateTime);

bool isEmail(String? email) {
  if (email == null) {
    return false;
  }

  String p =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regExp = RegExp(p);
  return regExp.hasMatch(email);
}

bool isPhoneNumber(String? phoneNumber) {
  if (phoneNumber == null) {
    return false;
  }
  // Regular expression for international phone numbers.
  final RegExp phoneNumberRegex = RegExp(r'^(\+|00)?[0-9]+$');

  if (!phoneNumberRegex.hasMatch(phoneNumber)) {
    return false;
  }

  if (phoneNumber.length < 10) {
    return false;
  }

  return true;
}
