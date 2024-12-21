import 'package:flutter/material.dart';
import 'package:musicme/common/theme/theme.dart';
import 'package:musicme/features/home/view/bottom_nav.dart';
import 'package:musicme/features/home/view/custom_appbar.dart';
import 'package:musicme/features/on_boarding/logic/sharedpref_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedprefServices.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeNotifier,
      builder: (context, themeMode, child) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightMode,
            darkTheme: darkMode,
            themeMode: themeMode,
            home: BottomNav()
            // HomeScreen()
            // const SplashScreen(),
            );
      },
    );
  }
}
