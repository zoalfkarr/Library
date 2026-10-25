import 'package:injectable/injectable.dart';

import '../entity/author.dart';
import '../repository/book_repository.dart';

@lazySingleton
class AddBookUseCase {
  final BookRepository repository;
  AddBookUseCase(this.repository);

  Future<void> call({
    required String title,
    required String year,
    required Author author,
  }) => repository.addBook(title: title, year: year, author: author);
}
