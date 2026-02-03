import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:productivity_manager/core/constants.dart';
import 'package:productivity_manager/modules/notebook/notebook_controller.dart';
import 'package:productivity_manager/modules/notebook/view/menu.dart';

class NoteBookScreen extends StatelessWidget {
  NoteBookScreen({super.key});
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      builder: (NotebookController controller) {
        return Scaffold(
          key: scaffoldKey,
          drawer: Menu(
            onCreateNotebook: () {
              // Handle create notebook action
            },
            onViewNotebooks: () {
              // Handle view notebooks action
            },
          ),
          appBar: AppBar(
            leading: icon_button_appbar(Icons.menu, () {
              scaffoldKey.currentState?.openDrawer();
            }),
            actions: [
              icon_button_appbar(Icons.alarm, () {}),
              icon_button_appbar(Icons.search, () {}),
              icon_button_appbar(Icons.add, () {}),

              icon_button_appbar(Icons.more_vert, () {}),
              // IconButton(icon: Icon(Icons.more_vert), onPressed: (){
              //   // Call logout method from AuthController
              //   // final authController = Get.find<AuthController>();
              //   // authController.logout();

              // }),
            ],
            title: const Text('Notebooks'),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: Appconstants.kdefpadding,
            ),
            child: GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              children: [
                // Column(
                // children: [
                //   Image.asset('assets/images/notebook_cover.png', height: 200
                //   , width: 200,),
                //   SizedBox(height: 12,),
                //   Text("NoteBook Name", style: TextStyle(
                //     fontSize: 16,
                //   ),),
                Notebook("Planned"),
                Notebook("Tasks and Reminders"),
                Notebook("Work"),

                Notebook("Personal"),

                Notebook("reminders"),

                Notebook("health"),

                Notebook("travel"),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget icon_button_appbar(icon, onPressed) {
    return IconButton(icon: Icon(icon), onPressed: onPressed);
  }

  Widget Notebook(String text) {
    return InkWell(
      onTap: () {
        Get.toNamed('/notes');
      },
      child: Column(
        children: [
          Expanded(child: Image.asset('assets/images/notebook_cover.png')),
          SizedBox(height: 12),
          Text(
            text,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 12),
        ],
      ),
    );
  }
}
