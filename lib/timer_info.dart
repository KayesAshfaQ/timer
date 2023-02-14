import 'dart:ui';
import 'dart:math' as math;

import 'package:flutter/foundation.dart';

class TimerInfo extends ChangeNotifier {
  int _remainingTime = 0;
  Color _color = Color(0xFF000000);

  get remainingTime => _remainingTime;

  get color => _color;

  void updateRemainingTime() {
    _remainingTime++;
    notifyListeners();
  }

  void resetRemainingTime() {
    _remainingTime = 0;
    notifyListeners();
  }

  void randomColor() {
    _color =
        Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
    print('color: $_color');
    notifyListeners();
  }
}
