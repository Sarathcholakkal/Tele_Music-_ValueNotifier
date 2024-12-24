import 'package:flutter/material.dart';
import 'package:musicme/features/drawer/view/drawer_widgets/drawer_widget.dart';
import 'package:musicme/features/frequently_played/view/frequently_played_section.dart';
import 'package:musicme/features/home/view/categorie_section.dart';
import 'package:musicme/features/home/view/custom_appbar.dart';
import 'package:musicme/features/home/view/name_section.dart';
import 'package:musicme/features/last_added/view/last_added_screen.dart';
import 'package:musicme/features/last_added/view/last_added_section.dart';
import 'package:musicme/features/recently_played/view/recently_played_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // fetchRecentlyPlayedSongs();
    // fetchFrequentlyPlayedSongs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: const DrawerWidget(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: const SingleChildScrollView(
            child: SizedBox(
              child: Column(
                children: [
                  NameSection(),
                  CategorySection(),
                  FrequentlyPlayedSection(),
                  RecentlyPlayedSection(),
                  LastAddedSection()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
