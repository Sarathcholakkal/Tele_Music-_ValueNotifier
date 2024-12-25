import 'package:flutter/material.dart';
import 'package:musicme/features/all_songs/logic/db_functions.dart';
import 'package:musicme/features/drawer/view/drawer_widgets/drawer_widget.dart';
import 'package:musicme/features/frequently_played/logic/frequently_played_functions.dart';
import 'package:musicme/features/frequently_played/view/frequently_played_section.dart';
import 'package:musicme/features/home/view/categorie_section.dart';
import 'package:musicme/features/home/view/custom_appbar.dart';
import 'package:musicme/features/home/view/name_section.dart';
import 'package:musicme/features/last_added/view/last_added_section.dart';
import 'package:musicme/features/recently_played/logic/recently_played_functions.dart';
import 'package:musicme/features/recently_played/view/recently_played_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    fetchRecentlyPlayedSongs();
    fetchFrequentlyPlayedSongs();
    getSongs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(),
      drawer: DrawerWidget(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: SingleChildScrollView(
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
