import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:musicme/common/theme/theme.dart';
import 'package:musicme/features/all_songs/model/songmodel_class.dart';
import 'package:musicme/features/home/view/custom_appbar.dart';
import 'package:musicme/features/on_boarding/logic/sharedpref_services.dart';
import 'package:musicme/features/splash/splash.dart';

Future<void> main() async {
  await JustAudioBackground.init(
    androidNotificationChannelId: 'com.ryanheise.bg_demo.channel.audio',
    androidNotificationChannelName: 'Audio playback',
    androidNotificationOngoing: true,
  );
  WidgetsFlutterBinding.ensureInitialized();
  await SharedprefServices.init();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(SongModelClassAdapter().typeId)) {
    Hive.registerAdapter(SongModelClassAdapter());
  }

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
          home:
              //  BottomNav()
              // HomeScreen()
              const SplashScreen(),
        );
      },
    );
  }
}
