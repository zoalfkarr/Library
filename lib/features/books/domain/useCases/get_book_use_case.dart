import 'package:injectable/injectable.dart';
import 'package:librarybooks/features/books/domain/entity/book.dart';
import 'package:librarybooks/features/books/domain/repository/book_repository.dart';

@lazySingleton
class GetBookUseCase {
  final BookRepository repository;
  GetBookUseCase(this.repository);

  Future<List<Book>> call() async {
    return await repository.getBooks();
  }
}
