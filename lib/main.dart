import 'package:flutter/material.dart';
import 'package:musicme/features/on_boarding/logic/sharedpref_services.dart';
import 'package:musicme/features/splash/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedprefServices.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      home: const SplashScreen(),
    );
  }
}
