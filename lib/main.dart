// main.dart

import 'package:flutter/material.dart';
import 'ConnectionStatusSingleton.dart';
import 'app.dart';

void main() {
  ConnectionStatusSingleton connectionStatus =
      ConnectionStatusSingleton.getInstance();
  connectionStatus.initialize();

  runApp(App());
}
