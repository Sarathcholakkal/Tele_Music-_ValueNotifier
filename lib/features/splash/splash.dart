import 'dart:io';
import 'package:flutter/material.dart';
import 'package:musicme/features/all_songs/logic/db_functions.dart';
import 'package:musicme/features/home/view/bottom_nav.dart';
import 'package:musicme/features/last_added/logic/last_added_function.dart';
import 'package:musicme/features/on_boarding/logic/sharedpref_services.dart';
import 'package:musicme/features/on_boarding/view/on_boarding_screen.dart';
import 'package:musicme/features/recently_played/logic/recently_played_functions.dart';
import 'package:permission_handler/permission_handler.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    goToLogin();

    super.initState();
  }

  //=============================================

  Future<void> goToLogin() async {
    await Future.delayed(const Duration(seconds: 2));

    await permissionStatusChecker();
    initDatabase();
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
          builder: (ctx) => SharedprefServices.isNameStored()
              ? const BottomNav()
              : const OnBoardingPage()),
    );
  }

  //===================================================================
  Future<void> initDatabase() async {
    await storeSongs();
    await getSongs();
    await storelastSongs();
    await getlastSongs();
    await fetchRecentlyPlayedSongs();
  }
  //?============================================================================ permissionStatusChecker====================

  Future<void> permissionStatusChecker() async {
    PermissionStatus status;

    await Future.delayed(const Duration(seconds: 5));

    status = await requestAudioPermission();
    if (status.isDenied) {
      status = await requestAudioPermission();

      if (status.isPermanentlyDenied) {
        bool flag = await openAppSettings();
        if (flag) {
          status.isGranted;
        }
      }
    }
  }

  //?=============================================================================helper function of permission status checker====================

  Future<PermissionStatus> requestAudioPermission() async {
    PermissionStatus status;

    if (Platform.isAndroid && await _isAndroid13OrHigher()) {
      // For Android 13 and above, request permission to access media files (audio)
      status = await Permission.audio.request();
    } else {
      // For Android versions below 13, request permission for storage
      status = await Permission.storage.request();
    }

    return status;
  }

// Helper function to check Android version
  Future<bool> _isAndroid13OrHigher() async {
    return Platform.operatingSystemVersion.contains('13');
  }

//======================================================================================build funtions
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: Image.asset("assets/image/splash_logo.png"),
        ),
      ),
    );
  }
}
