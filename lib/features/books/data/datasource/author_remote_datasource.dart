import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../models/author_model.dart';

@lazySingleton
class AuthorRemoteDataSource {
  final SupabaseClient supabaseClient;
  AuthorRemoteDataSource(this.supabaseClient);

  Future<List<AuthorModel>> fetchAuthors() async {
    final response = await supabaseClient.from('authors').select();
    return (response as List).map((e) => AuthorModel.fromJson(e)).toList();
  }

  Future<void> insertAuthor(String name) async {
    await supabaseClient.from('authors').insert({'name': name});
  }
}
