import 'package:injectable/injectable.dart';

import '../repository/author_repository.dart';

@lazySingleton
class AddAuthorUseCase {
  final AuthorRepository repository;
  AddAuthorUseCase(this.repository);

  Future<void> call(String name) => repository.addAuthor(name);
}
