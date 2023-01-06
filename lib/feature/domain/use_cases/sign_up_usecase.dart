import 'package:note_app_clean_architecture/feature/domain/entities/note_entity.dart';
import 'package:note_app_clean_architecture/feature/domain/repositories/firebase_repository.dart';

class UpdateUseCase {
  final FirebaseRepository repository;

  UpdateUseCase({required this.repository});

  Future<void> call(NoteEntity note) async {
    return repository.updateNote(note);
  }
}
