import 'package:injectable/injectable.dart';

import '../../domain/entity/author.dart';
import '../../domain/repository/author_repository.dart';
import '../datasource/author_remote_datasource.dart';

@LazySingleton(as: AuthorRepository)
class AuthorRepositoryImp implements AuthorRepository {
  final AuthorRemoteDataSource remoteDataSource;
  AuthorRepositoryImp(this.remoteDataSource);

  @override
  Future<List<Author>> getAuthors() async =>
      (await remoteDataSource.fetchAuthors()).cast<Author>();

  @override
  Future<void> addAuthor(String name) => remoteDataSource.insertAuthor(name);
}
