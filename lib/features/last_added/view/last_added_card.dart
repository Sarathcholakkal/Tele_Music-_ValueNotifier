import 'package:flutter/material.dart';

class LastAddedCard extends StatelessWidget {
  const LastAddedCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 190,
      width: 140,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Album image
          SizedBox(
            width: 140,
            height: 140,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(0.0),
                child: Container(
                  color: Colors.amber,
                )

                //  Image.asset(
                //   "",
                //   fit: BoxFit.cover,
                //   width: double.infinity,
                // ),
                ),
          ),
          const SizedBox(height: 5),
          // Album name
          const Text(
            'Album name',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 14,
            ),
            overflow: TextOverflow.ellipsis,
          ),
          // Artist name
          const Text(
            'song name',
            style: TextStyle(fontSize: 12, color: Colors.grey),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
