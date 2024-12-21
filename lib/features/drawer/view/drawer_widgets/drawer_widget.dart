import 'package:flutter/material.dart';
import 'package:musicme/features/drawer/view/drawer_widgets/drawer_body.dart';
import 'package:musicme/features/drawer/view/drawer_widgets/drawer_head.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Drawer(
      child: SingleChildScrollView(
        child: SizedBox(
          child: Column(
            children: [HeaderDrawer(), BodyDrawerWidget()],
          ),
        ),
      ),
    );
  }
}
