import 'package:flutter/material.dart';
import 'package:musicme/features/on_boarding/logic/sharedpref_services.dart';

class NameSection extends StatelessWidget {
  const NameSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 35,
      child: Text.rich(
        TextSpan(
          children: [
            const TextSpan(
              text: 'Hi,',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22, // Adjust font size as needed
              ),
            ),
            TextSpan(
              text: SharedprefServices.getName() ?? "",
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.pink,
                  letterSpacing: 1 // Adjust font size as needed
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
