import 'package:get/get.dart';
import 'package:productivity_manager/modules/notes/note_controller.dart';

class NotesBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(NoteController());
  }
}
