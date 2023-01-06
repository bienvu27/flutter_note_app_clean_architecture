import 'package:note_app_clean_architecture/feature/domain/repositories/firebase_repository.dart';

import '../entities/user_entity.dart';

class SignInUseCase {
  final FirebaseRepository repository;

  SignInUseCase({required this.repository});

  Future<void> call(UserEntity user) async {
    return repository.signIn(user);
  }
}
