// import 'package:flutter/material.dart';
// import 'package:musicme/features/frequently_played/view/heading.dart';
// import 'package:simphony/features/homepage/frequently_played/frequently_card.dart';
// import 'package:simphony/features/homepage/frequently_played/frequently_songs_screen.dart';
// import 'package:simphony/features/homepage/heading.dart';

// class FrequentlyPlayedSection extends StatelessWidget {
//   const FrequentlyPlayedSection({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       //todo  , sized box, heading ,,text button : see all ,

//       // todo sizedbox , listviview horizondal , card
//       // todo each card  photo boxfit , footer album name, artist name
//       height: 210,
//       width: double.infinity,
//       color: Colors.black,
//       child: Column(
//         children: [
//           Heading(
//               title: "Frequently Played",
//               screen: () => FrequentlySongsScreen()),
//           Container(
//             height: 170,
//             child: ListView.separated(
//                 scrollDirection: Axis.horizontal,
//                 itemBuilder: (BuildContext context, int index) {
//                   return FrequentlyCard();
//                 },
//                 separatorBuilder: (BuildContext context, int index) {
//                   return const SizedBox(
//                     width: 10,
//                   );
//                 },
//                 itemCount: 10),
//           )
//         ],
//       ),
//     );
//   }
// }
