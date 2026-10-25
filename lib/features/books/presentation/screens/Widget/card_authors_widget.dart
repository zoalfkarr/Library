import 'package:flutter/material.dart';

import '../../../data/models/author_model.dart';

class CardAuthorsWidget extends StatelessWidget {
  const new({super.key, required this.author});

  final AuthorModel author;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          child: Text(
            author.name.isNotEmpty ? author.name[0] : 'A',
            style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
          ),
        ),
        title: Text(
          author.name,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        subtitle: Text('Author ID: ${author.id}'),
      ),
    );
  }
}
