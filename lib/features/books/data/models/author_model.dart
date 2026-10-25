import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../domain/entity/author.dart';

class AuthorModel extends Author {
  AuthorModel({required super.id, required super.name});

  Map<String, dynamic> toJson() => {'id': id, 'name': name};

  factory AuthorModel.fromJson(Map<String, dynamic> json) {
    return AuthorModel(
      id:
          json['id']?.toString() ??
          DateTime.now().millisecondsSinceEpoch.toString(),
      name: json['name']?.toString() ?? '',
    );
  }

  static final SupabaseClient _supabase = Supabase.instance.client;

  static Future<List<AuthorModel>> fetchAuthors() async {
    try {
      final response = await _supabase.from('authors').select();
      return (response as List).map((e) => AuthorModel.fromJson(e)).toList();
    } catch (e) {
      debugPrint('Error fetching authors: $e');
      rethrow;
    }
  }

  static Future<void> addAuthor(String name) async {
    try {
      await _supabase.from('authors').insert({'name': name});
    } catch (e) {
      debugPrint('Error adding author: $e');
      rethrow;
    }
  }
}
