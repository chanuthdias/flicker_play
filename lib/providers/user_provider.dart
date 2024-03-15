import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  String? _firstName;
  String? _lastName;
  String? _imgPath;

  void setImagePath({required String imgPath}) {
    _imgPath = imgPath;
    notifyListeners();
  }

  void updateUserData({required String firstName, required String lastName}) {
    _firstName = firstName;
    _lastName = lastName;
    notifyListeners();
  }

  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get imgPath => _imgPath;
}
