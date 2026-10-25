import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../domain/entity/book.dart';
import 'author_model.dart';

class BookModel extends Book {
  BookModel({
    required super.id,
    required super.title,
    required super.year,
    required super.authorId,
    required super.authorName,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'year': year,
    'author_id': authorId,
    'author_name': authorName,
  };

  factory BookModel.fromJson(
    Map<String, dynamic> json, {
    String? resolvedAuthorName,
  }) {
    return BookModel(
      id:
          json['id']?.toString() ??
          DateTime.now().millisecondsSinceEpoch.toString(),
      title: json['title']?.toString() ?? '',
      year: (json['year'] ?? json['date'])?.toString() ?? '',
      authorId: json['author_id']?.toString() ?? '',
      authorName:
          resolvedAuthorName ??
          json['author_name']?.toString() ??
          'Unknown Author',
    );
  }

  static final SupabaseClient _supabase = Supabase.instance.client;

  static Future<List<BookModel>> fetchBooks() async {
    try {
      final response = await _supabase.from('books').select();
      final authors = await AuthorModel.fetchAuthors();
      final authorMap = {for (var a in authors) a.id: a.name};

      return (response as List).map((e) {
        final authorId = e['author_id']?.toString() ?? '';
        final authorName =
            authorMap[authorId] ??
            e['author_name']?.toString() ??
            'Unknown Author';
        return BookModel.fromJson(e, resolvedAuthorName: authorName);
      }).toList();
    } catch (e) {
      debugPrint('Error fetching books: $e');
      rethrow;
    }
  }

  static Future<void> addBook({
    required String title,
    required String year,
    required AuthorModel author,
  }) async {
    try {
      try {
        await _supabase.from('books').insert({
          'title': title,
          'year': year,
          'author_id': author.id,
          'author_name': author.name,
        });
      } catch (_) {
        try {
          await _supabase.from('books').insert({
            'title': title,
            'year': year,
            'author_id': author.id,
          });
        } catch (_) {
          await _supabase.from('books').insert({
            'title': title,
            'author_id': author.id,
          });
        }
      }
    } catch (e) {
      debugPrint('Error adding book: $e');
      rethrow;
    }
  }
}
