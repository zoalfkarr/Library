import 'package:injectable/injectable.dart';

import '../../domain/entity/author.dart';
import '../../domain/entity/book.dart';
import '../../domain/repository/book_repository.dart';
import '../datasource/book_remote_datasource.dart';

@LazySingleton(as: BookRepository)
class BookRepositoryImp implements BookRepository {
  final BookRemoteDataSource remoteDataSource;
  BookRepositoryImp(this.remoteDataSource);

  @override
  Future<List<Book>> getBooks() async =>
      (await remoteDataSource.fetchBooks()).cast<Book>();

  @override
  Future<void> addBook({
    required String title,
    required String year,
    required Author author,
  }) => remoteDataSource.insertBook(
    title: title,
    year: year,
    authorId: author.id,
    authorName: author.name,
  );
}
