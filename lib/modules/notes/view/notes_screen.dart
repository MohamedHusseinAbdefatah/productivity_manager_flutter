import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:productivity_manager/core/constants.dart';
import 'package:productivity_manager/modules/notes/note_controller.dart';

import '../../../core/routes/routes.dart' show AppRoutes;
import 'note_details.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NoteController());

    return Scaffold(
      appBar: AppBar(title: const Text('Notes')),
      body: Obx(
        () => GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.8,
          ),
          itemCount: controller.notes.length,
          itemBuilder: (context, index) {
            final note = controller.notes[index];
            return InkWell(
              onTap: () {
                Get.toNamed(
                  AppRoutes.noteDetail,
                  arguments: [note.id, note.title, note.content, note.color],
                );
              },
              child: Card(
                color: note.color,
                child: Padding(
                  padding: const EdgeInsets.all(Appconstants.kdefpadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        note.title,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        note.content,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const Spacer(),
                      Text(
                        note.createdAt.toString(),
                        style: const TextStyle(
                          fontSize: 10,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.addNote(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
