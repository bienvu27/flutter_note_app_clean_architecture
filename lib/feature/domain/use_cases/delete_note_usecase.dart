import 'package:note_app_clean_architecture/feature/domain/entities/note_entity.dart';
import 'package:note_app_clean_architecture/feature/domain/repositories/firebase_repository.dart';

class DeleteTaskUseCase {
  final FirebaseRepository repository;

  DeleteTaskUseCase({required this.repository});

  Future<void> call(NoteEntity note) async {
    return repository.deleteNote(note);
  }
}