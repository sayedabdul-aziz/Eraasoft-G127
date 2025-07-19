import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/core/services/local_storage.dart';
import 'package:note_app/feature/shared/cubit/note_state.dart';
import 'package:note_app/feature/shared/model/note_model.dart';

class NoteCubit extends Cubit<NoteState> {
  NoteCubit() : super(NoteInitial());

  List<NoteModel> notes = [];

  getNotes() {
    emit(NoteLoadingState());
    notes = AppLocalStorage.getAllNotes();
    emit(NoteLoadedState());
  }

  addNote(NoteModel note) {
    emit(NoteLoadingState());
    AppLocalStorage.addNote(note);
    emit(NoteCreateState());
  }

  deleteNote(int index) {
    emit(NoteLoadingState());
    AppLocalStorage.deleteNote(index);
    emit(NoteLoadedState());
  }

  updateNote(int index, NoteModel note) {
    emit(NoteLoadingState());
    AppLocalStorage.updateNote(index, note);
    emit(NoteLoadedState());
  }
}
