import 'package:ecommerce_app/my_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  //Widget Flutter Bindig
  final WidgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  //flutter Native Splash
  //FlutterNativeSplash.preserve(widgetsBinding: WidgetsBinding);

  /// Portrait Up the device
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MainApp());
}
