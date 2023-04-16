import 'package:flutter/foundation.dart';

class StepperProvider with ChangeNotifier {
  int _currentStep = 0;
  int get currentStep => _currentStep;

  void continueStepper() {
    _currentStep++;
    notifyListeners();
  }

  void cancelStepper() {
    _currentStep--;
    notifyListeners();
  }
}
