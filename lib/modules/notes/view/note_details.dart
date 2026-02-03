import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:productivity_manager/modules/notes/note_controller.dart';

class NoteDetails extends StatelessWidget {
  NoteDetails({super.key});

  final TextEditingController noteContentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments;
    final noteId = args[0] as String;
    final title = args[1] as String;
    final content = args[2] as String;
    final notecolor = args[3] as Color;

    // Initialize controller with existing content
    noteContentController.text = content;

    return GetBuilder<NoteController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: notecolor,
          appBar: AppBar(
            shape: Border(bottom: BorderSide(color: Colors.black45)),
            backgroundColor: notecolor,
            title: Text(title),
            actions: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.alarm)),
              IconButton(
                onPressed: () {
                  // Update the note with edited content
                  controller.updateNote(
                    noteId,
                    title,
                    noteContentController.text,
                  );
                  Get.back();
                },
                icon: const Icon(Icons.save),
              ),
              IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: noteContentController,
              maxLines: null,
              expands: true,
              autofocus: true,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: '',
              ),
            ),
          ),
        );
      },
    );
  }
}
