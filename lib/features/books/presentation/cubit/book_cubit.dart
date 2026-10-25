import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entity/author.dart';
import '../../domain/useCases/add_book_use_case.dart';
import '../../domain/useCases/get_book_use_case.dart';
import 'book_state.dart';

@injectable
class BookCubit extends Cubit<BookState> {
  final GetBookUseCase getBookUseCase;
  final AddBookUseCase addBookUseCase;
  BookCubit(this.getBookUseCase, this.addBookUseCase) : super(BookInitial());

  Future<void> loadBooks() async {
    emit(BookLoading());
    try {
      final books = await getBookUseCase();
      emit(BookLoaded(books));
    } catch (e) {
      emit(BookError(e.toString()));
    }
  }

  Future<void> addBook({
    required String title,
    required String year,
    required Author author,
  }) async {
    try {
      await addBookUseCase(title: title, year: year, author: author);
      loadBooks();
    } catch (e) {
      emit(BookError(e.toString()));
    }
  }
}
