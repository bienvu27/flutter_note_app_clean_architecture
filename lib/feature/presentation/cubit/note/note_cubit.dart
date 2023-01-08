import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:note_app_clean_architecture/feature/domain/entities/note_entity.dart';

import '../../../domain/use_cases/add_new_note_usercase.dart';
import '../../../domain/use_cases/delete_note_usecase.dart';
import '../../../domain/use_cases/get_note_usecase.dart';
import '../../../domain/use_cases/update_note_usecase.dart';

part 'note_state.dart';

class NoteCubit extends Cubit<NoteState> {
  final UpdateNoteUseCase updateNoteUsecase;
  final DeleteNoteUseCase deleteNoteUseCase;
  final GetNoteUseCase getNoteUseCase;
  final AddNewNoteUseCase addNewNoteUseCase;

  NoteCubit(
      {required this.updateNoteUsecase,
      required this.deleteNoteUseCase,
      required this.getNoteUseCase,
      required this.addNewNoteUseCase})
      : super(NoteInitial());

  Future<void> addNote({required NoteEntity note}) async {
    try {
      await addNewNoteUseCase.call(note);
    } on SocketException catch (_) {
      emit(NoteFailure());
    } catch (_) {
      emit(NoteFailure());
    }
  }

  Future<void> deleteNote({required NoteEntity note}) async {
    try {
      await deleteNoteUseCase.call(note);
    } on SocketException catch (_) {
      emit(NoteFailure());
    } catch (_) {
      emit(NoteFailure());
    }
  }

  Future<void> updateNote({required NoteEntity note}) async {
    try {
      await updateNoteUsecase.call(note);
    } on SocketException catch (_) {
      emit(NoteFailure());
    } catch (_) {
      emit(NoteFailure());
    }
  }

  Future<void> getNotes({required String uid}) async {
    emit(NoteLoading());
    try {
      getNoteUseCase.call(uid).listen((notes) {
        emit(NoteLoaded(notes: notes));
      });
    } on SocketException catch (_) {
      emit(NoteFailure());
    } catch (_) {
      emit(NoteFailure());
    }
  }
}
