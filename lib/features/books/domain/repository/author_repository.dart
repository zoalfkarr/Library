import '../entity/author.dart';

abstract class AuthorRepository {
  Future<List<Author>> getAuthors();
  Future<void> addAuthor(String name);
}
