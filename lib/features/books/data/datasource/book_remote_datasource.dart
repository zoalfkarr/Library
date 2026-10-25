import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../models/author_model.dart';
import '../models/book_model.dart';

@lazySingleton
class BookRemoteDataSource {
  final SupabaseClient supabaseClient;
  BookRemoteDataSource(this.supabaseClient);

  Future<List<BookModel>> fetchBooks() async {
    return await BookModel.fetchBooks();
  }

  Future<void> insertBook({
    required String title,
    required String year,
    required String authorId,
    required String authorName,
  }) async {
    await BookModel.addBook(
      title: title,
      year: year,
      author: AuthorModel(id: authorId, name: authorName),
    );
  }
}
