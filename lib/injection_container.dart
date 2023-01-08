import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:note_app_clean_architecture/feature/data/remote/data_sources/firebase_remote_data_source_impl.dart';

GetIt sl = GetIt.instance;

Future<void> init() async {
  // data source
  sl.registerLazySingleton(() => FirebaseRemoteDataSourceImpl(auth: sl.call(), firestore: sl.call()));

  // External
  final auth = FirebaseAuth.instance;
  final fireStore = FirebaseFirestore.instance;

  sl.registerLazySingleton(() => auth);
}
