import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/tools/tools.dart';
import 'app/app.dart';


void main() {
  ServiceRegister.start();
  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}