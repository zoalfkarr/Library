import '../entity/author.dart';
import '../entity/book.dart';

abstract class BookRepository {
  Future<List<Book>> getBooks();

  Future<void> addBook({
    required String title,
    required String year,
    required Author author,
  });
}
