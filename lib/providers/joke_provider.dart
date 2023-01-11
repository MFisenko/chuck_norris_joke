import 'package:flutter/cupertino.dart';

class JokeProvider extends ChangeNotifier {
  String _chosenCategory = "";

  String get chosenCategory {
    return _chosenCategory;
  }

  void setCategory(String title) {
    _chosenCategory = title;
  }
}
