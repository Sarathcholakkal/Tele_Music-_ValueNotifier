import 'package:flutter/material.dart';
import 'package:musicme/common/utils/const/pallets.dart';
import 'package:musicme/features/all_songs/view/all_song_screen.dart';
import 'package:musicme/features/home/view/home_screen.dart';

import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

var _screens = [
  const HomeScreen(),
  const HomeScreen(),
  const ScreenAllSongs(),
  const HomeScreen(),
  // const Favtest(),
  // const ScreenAllSongs(),
  // const PlaylistScreen(),
];

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _currentIndex = 0;
  final _items = [
    SalomonBottomBarItem(
      icon: const Icon(Icons.home),
      title: const Text('Home'),
      selectedColor: Pallete.bottomNavColor,
    ),
    SalomonBottomBarItem(
      icon: const Icon(Icons.favorite),
      title: const Text('Favories'),
      selectedColor: Pallete.bottomNavColor,
    ),
    SalomonBottomBarItem(
      icon: const Icon(Icons.library_music),
      title: const Text('Songs'),
      selectedColor: Pallete.bottomNavColor,
    ),
    SalomonBottomBarItem(
      icon: const Icon(Icons.queue_music),
      title: const Text('Playlists'),
      selectedColor: Pallete.bottomNavColor,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Card(
        elevation: 6,
        margin: const EdgeInsets.all(10.0),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
          child: SalomonBottomBar(
            itemPadding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            items: _items,
            // backgroundColor: Colors.white60,
            currentIndex: _currentIndex,
            onTap: (index) => setState(
              () {
                _currentIndex = index;
              },
            ),
          ),
        ),
      ),
      body: _screens[_currentIndex],
    );
  }
}
