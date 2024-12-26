import 'package:flutter/material.dart';

extension Navigation on BuildContext {
  //Colors
 // MyColors get colors => Theme.of(this).extension<MyColors>()!;

  //Images
  //MyAssets get images => Theme.of(this).extension<MyAssets>()!;

  //Localization

  // AppLocalizations get tr => AppLocalizations.of(this);
// Localizations.localeOf(context)
//   Locale get currentLocale => Localizations.localeOf(this);
// bool get isEnlocale => currentLocale.languageCode == 'en';

  //Navigation
  Future<dynamic> pushNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }


  Future<dynamic> pushNamedAndRemoveUntil(
    String routeName, {
     Object? arguments,
     RoutePredicate? predicate,
  }) {
    return Navigator.of(this)
        .pushNamedAndRemoveUntil(routeName, predicate!, arguments: arguments);
  }

  Future<dynamic> pushReplacementNamed(
    String routeName, {
    Object? arguments,
  }) {
    return Navigator.of(this)
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  void pop() => Navigator.of(this).pop();
}
extension StringExtension on String? {
  bool isNullOrEmpty() => this == null || this == '';
}

extension ListExtension<T> on List<T>? {
  bool isNullOrEmpty() => this == null || this!.isEmpty;
}
