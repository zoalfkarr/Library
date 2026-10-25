import 'package:injectable/injectable.dart';

import '../entity/author.dart';
import '../repository/author_repository.dart';

@lazySingleton
class GetAuthorsUseCase {
  final AuthorRepository repository;
  GetAuthorsUseCase(this.repository);

  Future<List<Author>> call() => repository.getAuthors();
}
