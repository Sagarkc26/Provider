import 'package:flutter/foundation.dart';

class CounterProvider with ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void removeCounter() {
    _count--;
    notifyListeners();
  }

  void resetCounter() {
    _count = 0;
    notifyListeners();
  }

  void addCounter() {
    _count++;
    notifyListeners();
  }

  double _currentvalue = 1;
  double get currentvalue => _currentvalue;

  void setValue(double val) {
    _currentvalue = val;
    notifyListeners();
  }
}
