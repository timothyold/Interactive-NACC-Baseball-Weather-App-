// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:mp5/Views/Field.dart';
import 'package:mp5/Views/favorites.dart';
import 'package:provider/provider.dart';
import 'package:mp5/models/models.dart';
import 'package:mp5/providers/favorites_provider.dart'; // Import FavoritesProvider

class FieldSelectionScreen extends StatelessWidget {
  final List<Field> fields;
  const FieldSelectionScreen({super.key, required this.fields});

  @override
  Widget build(BuildContext context) {
    final favoritesProvider = Provider.of<FavoritesProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Select a Field')),
      body: ListView.builder(
        itemCount: fields.length,
        itemBuilder: (context, index) {
          bool isFavorite =
              favoritesProvider.favorites.contains(fields[index].name);
          return ListTile(
            title: Text(fields[index].name),
            subtitle: Text(fields[index].location),
            trailing: IconButton(
              icon: Icon(isFavorite ? Icons.star : Icons.star_border),
              color: isFavorite ? Colors.yellow : null,
              onPressed: () =>
                  favoritesProvider.toggleFavorite(fields[index].name),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FieldScreen(field: fields[index]),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.favorite),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const FavoritesScreen()),
          );
        },
      ),
    );
  }
}
