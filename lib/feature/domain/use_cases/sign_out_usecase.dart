import 'package:note_app_clean_architecture/feature/domain/repositories/firebase_repository.dart';

class IsSignInUserCase {
  final FirebaseRepository repository;

  IsSignInUserCase({required this.repository});

  Future<bool> call() async {
    return repository.isSignIn();
  }
}
