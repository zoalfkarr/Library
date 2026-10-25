// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:librarybooks/core/injection.dart' as _i253;
import 'package:librarybooks/features/books/data/datasource/author_remote_datasource.dart'
    as _i858;
import 'package:librarybooks/features/books/data/datasource/book_remote_datasource.dart'
    as _i30;
import 'package:librarybooks/features/books/data/repository/author_repository_imp.dart'
    as _i71;
import 'package:librarybooks/features/books/data/repository/book_repository_imp.dart'
    as _i994;
import 'package:librarybooks/features/books/domain/repository/author_repository.dart'
    as _i128;
import 'package:librarybooks/features/books/domain/repository/book_repository.dart'
    as _i712;
import 'package:librarybooks/features/books/domain/useCases/add_author_use_case.dart'
    as _i66;
import 'package:librarybooks/features/books/domain/useCases/add_book_use_case.dart'
    as _i553;
import 'package:librarybooks/features/books/domain/useCases/get_authors_use_case.dart'
    as _i250;
import 'package:librarybooks/features/books/domain/useCases/get_book_use_case.dart'
    as _i369;
import 'package:librarybooks/features/books/presentation/cubit/author_cubit.dart'
    as _i47;
import 'package:librarybooks/features/books/presentation/cubit/book_cubit.dart'
    as _i338;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i454.SupabaseClient>(() => registerModule.supabaseClient);
    gh.lazySingleton<_i858.AuthorRemoteDataSource>(
      () => _i858.AuthorRemoteDataSource(gh<_i454.SupabaseClient>()),
    );
    gh.lazySingleton<_i30.BookRemoteDataSource>(
      () => _i30.BookRemoteDataSource(gh<_i454.SupabaseClient>()),
    );
    gh.lazySingleton<_i712.BookRepository>(
      () => _i994.BookRepositoryImp(gh<_i30.BookRemoteDataSource>()),
    );
    gh.lazySingleton<_i128.AuthorRepository>(
      () => _i71.AuthorRepositoryImp(gh<_i858.AuthorRemoteDataSource>()),
    );
    gh.lazySingleton<_i66.AddAuthorUseCase>(
      () => _i66.AddAuthorUseCase(gh<_i128.AuthorRepository>()),
    );
    gh.lazySingleton<_i250.GetAuthorsUseCase>(
      () => _i250.GetAuthorsUseCase(gh<_i128.AuthorRepository>()),
    );
    gh.lazySingleton<_i553.AddBookUseCase>(
      () => _i553.AddBookUseCase(gh<_i712.BookRepository>()),
    );
    gh.lazySingleton<_i369.GetBookUseCase>(
      () => _i369.GetBookUseCase(gh<_i712.BookRepository>()),
    );
    gh.factory<_i47.AuthorCubit>(
      () => _i47.AuthorCubit(
        gh<_i250.GetAuthorsUseCase>(),
        gh<_i66.AddAuthorUseCase>(),
      ),
    );
    gh.factory<_i338.BookCubit>(
      () => _i338.BookCubit(
        gh<_i369.GetBookUseCase>(),
        gh<_i553.AddBookUseCase>(),
      ),
    );
    return this;
  }
}

class _$RegisterModule extends _i253.RegisterModule {}
