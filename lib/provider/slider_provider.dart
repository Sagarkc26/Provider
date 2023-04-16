import 'package:flutter/foundation.dart';

class SliderProvider with ChangeNotifier {
  double _currentvalue = 1;
  double get currentvalue => _currentvalue;

  void setValue(double val) {
    _currentvalue = val;
    notifyListeners();
  }
}
