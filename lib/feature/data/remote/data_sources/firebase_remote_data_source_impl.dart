import 'package:note_app_clean_architecture/feature/data/remote/data_sources/firebase_remote_data_source.dart';
import 'package:note_app_clean_architecture/feature/domain/entities/note_entity.dart';
import 'package:note_app_clean_architecture/feature/domain/entities/user_entity.dart';

class FirebaseRemoteDataSourceImpl implements FirebaseRemoteDataSource {
  @override
  Future<void> addNewNote(NoteEntity note) {
    // TODO: implement addNewNote
    throw UnimplementedError();
  }

  @override
  Future<void> deleteNote(NoteEntity note) {
    // TODO: implement deleteNote
    throw UnimplementedError();
  }

  @override
  Future<void> getCreateCurrentUser(UserEntity user) {
    // TODO: implement getCreateCurrentUser
    throw UnimplementedError();
  }

  @override
  Future<String> getCurrentUId() {
    // TODO: implement getCurrentUId
    throw UnimplementedError();
  }

  @override
  Stream<List<NoteEntity>> getNotes(String uid) {
    // TODO: implement getNotes
    throw UnimplementedError();
  }

  @override
  Future<bool> isSignIn() {
    // TODO: implement isSignIn
    throw UnimplementedError();
  }

  @override
  Future<void> signIn(UserEntity user) {
    // TODO: implement signIn
    throw UnimplementedError();
  }

  @override
  Future<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  @override
  Future<void> signUp(UserEntity user) {
    // TODO: implement signUp
    throw UnimplementedError();
  }

  @override
  Future<void> updateNote(NoteEntity note) {
    // TODO: implement updateNote
    throw UnimplementedError();
  }
}
