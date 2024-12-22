import 'package:flutter/material.dart';
import 'package:musicme/common/utils/const/image.dart';
import 'package:musicme/common/utils/const/pallets.dart';

ValueNotifier<ThemeMode> themeNotifier =
    ValueNotifier<ThemeMode>(ThemeMode.light);

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Image(
        image: AssetImage(Images.name),
        height: 20,
      ),
      actions: [
        ValueListenableBuilder<ThemeMode>(
            valueListenable: themeNotifier,
            builder: (BuildContext ctx, newTheme, _) {
              return IconButton(
                  onPressed: () {
                    themeNotifier.value = themeNotifier.value == ThemeMode.light
                        ? ThemeMode.dark
                        : ThemeMode.light;
                  },
                  icon: newTheme == ThemeMode.light
                      ? const Icon(
                          Icons.dark_mode,
                          color: Pallete.darkThemeIconColor,
                          size: 25,
                        )
                      : const Icon(
                          Icons.light_mode,
                          color: Pallete.lightThemeIconColor,
                          size: 25,
                        ));
            }),
        const SizedBox(
          width: 10,
        )
      ],
    );
  }

  // This is required to properly define the size of the AppBar
  @override
  Size get preferredSize => const Size.fromHeight(42);
}

























// class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
//   const CustomAppBar({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       title: const Image(
//         image: AssetImage(LocalImage.logo),
//         height: 20,
//       ),
//       actions: [
//         ValueListenableBuilder<bool>(
//           valueListenable: hasDarkModechanged,
//           builder: (BuildContext context, bool isDarkMode, _) {
//             return IconButton(
//               icon: Icon(
//                 isDarkMode ? Icons.dark_mode : Icons.light_mode,
//                 color: isDarkMode
//                     ? Pallete.darkMModeIconColor
//                     : Pallete.lightModeIconColor,
//                 size: 25,
//               ),
//               onPressed: () {
//                 // Toggle the theme
//                 hasDarkModechanged.value = !isDarkMode;
//                 themeNotifier.value =
//                     isDarkMode ? ThemeMode.light : ThemeMode.dark;
//               },
//             );
//           },
//         ),
//       ],
//     );
//   }

//   @override
//   Size get preferredSize => const Size.fromHeight(42);
// }







