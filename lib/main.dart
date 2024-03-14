import 'package:flutter/material.dart';
import 'package:my_calculator/view/models/calculator_model.dart';
import 'package:my_calculator/view/splash/splash_view.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ChangeNotifierProvider(
    create: (context) => CalProvider(),
    child: MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: const SplashView(),
    ),
  ));
}
