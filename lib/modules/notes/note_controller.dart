import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:productivity_manager/modules/notes/note_model.dart';

class NoteController extends GetxController {
  final notes = <Note>[].obs;

  final List<Color> colors = [
    Colors.red.shade100,
    Colors.blue.shade100,
    Colors.green.shade100,
    Colors.yellow.shade100,
    Colors.purple.shade100,
    Colors.orange.shade100,
    Colors.cyan.shade100,
    Colors.pink.shade100,
    Colors.teal.shade100,
    Colors.lime.shade100,
  ];

  Color _getColorForNote(String id) {
    // Use the note ID to generate a consistent color
    final hash = id.hashCode.abs();
    return colors[hash % colors.length];
  }

  NoteController() {
    // Initialize with dummy data
    notes.addAll([
      Note(
        id: '1',
        title: 'Welcome to Notes',
        content: 'This is your first note. Start writing your thoughts here!',
        color: _getColorForNote('1'),
        createdAt: DateTime.now().subtract(const Duration(days: 2)),
        updatedAt: DateTime.now().subtract(const Duration(days: 2)),
      ),
      Note(
        id: '2',
        title: 'Shopping List',
        content: 'Milk, Eggs, Bread, Butter, Coffee, Fruits',
        color: _getColorForNote('2'),
        createdAt: DateTime.now().subtract(const Duration(days: 1)),
        updatedAt: DateTime.now(),
      ),
      Note(
        id: '3',
        title: 'Meeting Notes',
        content:
            'Discuss project timeline with team. Follow up on action items.',
        color: _getColorForNote('3'),
        createdAt: DateTime.now().subtract(const Duration(hours: 5)),
        updatedAt: DateTime.now().subtract(const Duration(hours: 2)),
      ),
      Note(
        id: '4',
        title: 'Ideas',
        content: 'App idea: A productivity tracker with gamification elements',
        color: _getColorForNote('4'),
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
    ]);
  }

  void addNote() {
    // Add note logic
  }

  void updateNote(String id, String title, String content) {
    final index = notes.indexWhere((n) => n.id == id);
    if (index != -1) {
      notes[index] = Note(
        id: id,
        title: title,
        content: content,
        color: notes[index].color,
        createdAt: notes[index].createdAt,
        updatedAt: DateTime.now(),
      );
    }
  }

  void deleteNote(String id) {
    notes.removeWhere((n) => n.id == id);
  }
}
