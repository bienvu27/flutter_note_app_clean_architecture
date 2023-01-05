import 'package:note_app_clean_architecture/feature/domain/entities/note_entity.dart';
import 'package:note_app_clean_architecture/feature/domain/entities/user_entity.dart';
import 'package:note_app_clean_architecture/feature/domain/repositories/firebase_repository.dart';

class GetCreateCurrentUsecase {
  final FirebaseRepository repository;

  GetCreateCurrentUsecase({required this.repository});

  Future<void> call(UserEntity user) async {
    return repository.getCreateCurrentUser(user);
  }
}
