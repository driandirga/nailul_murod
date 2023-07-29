import 'dart:async';

import 'package:flutter/material.dart';

class Debouncer {
  final int milliseconds;

  VoidCallback? action;
  Timer? _timer;
  Debouncer({required this.milliseconds});

  run(VoidCallback action, void print) {
    if (null != _timer) {
      _timer?.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}
