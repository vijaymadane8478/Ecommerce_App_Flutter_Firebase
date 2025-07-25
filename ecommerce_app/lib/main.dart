import 'package:ecommerce_app/data/repositories/authentication_repository.dart';
import 'package:ecommerce_app/firebase_options.dart';
import 'package:ecommerce_app/my_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
//import 'package:flutter_native_splash/flutter_native_splash.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //Widget Flutter Bindig
  final WidgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  //flutter Native Splash
  FlutterNativeSplash.preserve(widgetsBinding: WidgetsBinding);

  //Get storage initilize
  await GetStorage.init();

  //FIRBASE INITILIZATION
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((Value) {
    Get.put(AuthenticationRepository());
  });

  /// Portrait Up the device
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MainApp());
}
