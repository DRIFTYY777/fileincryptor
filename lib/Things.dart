import 'main.dart';

import 'package:flutter/material.dart';

///Things contains all the methods and variables that are used in the app
///
///Also contains the basics [Functions]
class Things {
  ///
  /// [SnackBar] is used to show Message in the bottom of the screen
  ///
  /// Only one param [message] is required
  void eatItSnackBar(String message) {
    SnackBar snackBar = SnackBar(
      backgroundColor: const Color.fromARGB(255, 43, 224, 248),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      dismissDirection: DismissDirection.startToEnd,
      behavior: SnackBarBehavior.floating,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      content: Text(message),
    );
    snackbarKey.currentState?.showSnackBar(snackBar);
  }
}
