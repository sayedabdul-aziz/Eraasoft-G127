import 'package:hive/hive.dart';
import 'package:note_app/feature/shared/model/note_model.dart';

class AppLocalStorage {
  static late Box<NoteModel> noteBox;

  static String noteBoxName = 'notes';

  static init() {
    noteBox = Hive.box<NoteModel>(noteBoxName);
  }

  static void addNote(NoteModel note) {
    noteBox.add(note);
  }

  static void deleteNote(int index) {
    noteBox.deleteAt(index);
  }

  static void updateNote(int index, NoteModel note) {
    noteBox.putAt(index, note);
  }

  static List<NoteModel> getAllNotes() {
    return noteBox.values.toList();
  }
}
