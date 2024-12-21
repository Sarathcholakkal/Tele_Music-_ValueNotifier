import 'package:flutter/material.dart';

class CategorySection extends StatefulWidget {
  const CategorySection({
    super.key,
  });

  @override
  State<CategorySection> createState() => _CategorySectionState();
}

class _CategorySectionState extends State<CategorySection> {
  List<String> categoryList = [
    'SONGS',
    'ALBUMS',
    'ARTISTS',
    'FAVORITES',
    'PLAYLISTS',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      color: Colors.red,
      // child: ValueListenableBuilder<List<SongModelClass>>(
      //   valueListenable: favoriteListNotifier,
      //   builder: (BuildContext context, List<SongModelClass> favoriteSongs, _) {
      //     return ValueListenableBuilder<List<SongModelClass>>(
      //       valueListenable: songsListNotifier,
      //       builder: (BuildContext context, List<SongModelClass> songs, _) {
      //         return ValueListenableBuilder<List<PlaylistModelClass>>(
      //           valueListenable: playlistNotifier,
      //           builder: (BuildContext context,
      //               List<PlaylistModelClass> playlists, _) {
      //             List<String> categoryCount = [
      //               songs.length.toString(),
      //               "0", // Placeholder for albums
      //               "0", // Placeholder for artists
      //               favoriteSongs.length.toString(),
      //               playlists.length.toString(),
      //             ];

      //             return ListView.builder(
      //               scrollDirection: Axis.horizontal,
      //               itemCount: categoryList.length,
      //               itemBuilder: (BuildContext context, int index) {
      //                 final category = categoryList[index];
      //                 final count = categoryCount[index];

      //                 return Stack(
      //                   children: [
      //                     Card(
      //                       elevation: 0,
      //                       shape: RoundedRectangleBorder(
      //                         side: BorderSide.none,
      //                         borderRadius: BorderRadius.circular(15),
      //                       ),
      //                       margin: const EdgeInsets.all(10),
      //                       child: SizedBox(
      //                         height: 50,
      //                         width: 139,
      //                         child: Column(
      //                           mainAxisAlignment: MainAxisAlignment.center,
      //                           children: [
      //                             Text(
      //                               category,
      //                               style: const TextStyle(
      //                                 // color: Pallete.textColorGrey,
      //                                 fontSize: 16,
      //                               ),
      //                             ),
      //                             Text(
      //                               count,
      //                               style: const TextStyle(
      //                                   // color: Pallete.textColorGrey,
      //                                   ),
      //                             )
      //                           ],
      //                         ),
      //                       ),
      //                     ),
      //                     Positioned(
      //                       left: 20,
      //                       bottom: 7,
      //                       child: Image.asset(
      //                         // LocalImage.musicSymbol,
      //                         width: 15.0,
      //                         height: 25.0,
      //                         fit: BoxFit.cover,
      //                       ),
      //                     ),
      //                   ],
      //                 );
      //               },
      //             );
      //           },
      //         );
      //       },
      //     );
      //   },
      // ),
    );
  }
}
