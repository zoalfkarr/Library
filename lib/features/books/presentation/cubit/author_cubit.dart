import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/useCases/add_author_use_case.dart';
import '../../domain/useCases/get_authors_use_case.dart';
import 'author_state.dart';

@injectable
class AuthorCubit extends Cubit<AuthorState> {
  final GetAuthorsUseCase getAuthorsUseCase;
  final AddAuthorUseCase addAuthorUseCase;

  AuthorCubit(this.getAuthorsUseCase, this.addAuthorUseCase)
    : super(AuthorInitial());

  Future<void> loadAuthors() async {
    emit(AuthorLoading());
    try {
      final authors = await getAuthorsUseCase();
      emit(AuthorLoaded(authors));
    } catch (e) {
      emit(AuthorError(e.toString()));
    }
  }

  Future<void> addAuthor(String name) async {
    try {
      await addAuthorUseCase(name);
      loadAuthors();
    } catch (e) {
      emit(AuthorError(e.toString()));
    }
  }
}
