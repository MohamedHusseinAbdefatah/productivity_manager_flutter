import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:productivity_manager/core/constants.dart';

import '../../auth/controller.dart';

class Menu extends StatelessWidget {
  final VoidCallback onCreateNotebook;
  final VoidCallback onViewNotebooks;

  const Menu({
    super.key,
    required this.onCreateNotebook,
    required this.onViewNotebooks,
  });

  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthController>();

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Appconstants.kprimaryclolor),
            child: Text(
              'Notebook Menu',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          MenuItem(Icons.create, "Create Notebook", () {
            onCreateNotebook();
          }),
          MenuItem(Icons.book, "View Notebooks", () {
            onViewNotebooks();
          }),
          MenuItem(Icons.note, "All Notecards", () {}),
          MenuItem(Icons.favorite, "Favorites", () {}),
          MenuItem(Icons.delete, "Trash", () {}),
          MenuItem(Icons.settings, "Settings", () {}),
          MenuItem(Icons.person_2, "Shared with me", () {}),
          MenuItem(Icons.tag, "Tags", () {}),
          Divider(),
          MenuItem(Icons.logout, "Logout", () {
            // Implement logout functionality
          }),
          MenuItem(Icons.person_3_outlined, "view account", () {}),
          MenuItem(Icons.question_mark_outlined, "Help and Feedback", () {}),
          MaterialButton(
            onPressed: authController.logout,
            child: Text("Logout"),
            color: Appconstants.kerrorcolor,
          ),
        ],
      ),
    );
  }
}

Widget MenuItem(IconData icon, String title, VoidCallback onTap) {
  return ListTile(leading: Icon(icon), title: Text(title), onTap: onTap);
}
