import 'package:flutter/material.dart';
import 'package:mp5/Views/Field.dart';
import 'package:mp5/Views/Menu.dart';
import 'package:mp5/models/models.dart';
import 'package:provider/provider.dart';
import 'package:mp5/providers/favorites_provider.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favoritesProvider = Provider.of<FavoritesProvider>(context);
    final favoriteFields = fieldsData
        .where((field) => favoritesProvider.favorites.contains(field.name))
        .toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Favorite Fields')),
      body: favoriteFields.isEmpty
          ? Center(
              child: ElevatedButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          FieldSelectionScreen(fields: fieldsData)),
                ),
                child: const Text('Add fields to favorites'),
              ),
            )
          : ListView.builder(
              itemCount: favoriteFields.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(favoriteFields[index].name),
                  subtitle: Text(favoriteFields[index].location),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            FieldScreen(field: favoriteFields[index]),
                      ),
                    );
                  },
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.list),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => FieldSelectionScreen(
                      fields: fieldsData,
                    )),
          );
        },
      ),
    );
  }

  fieldSelectionScreen({required Field field}) {}
}
