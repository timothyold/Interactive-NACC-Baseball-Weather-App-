import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoritesProvider with ChangeNotifier {
  Set<String> _favorites = {};

  Set<String> get favorites => _favorites;

  FavoritesProvider() {
    loadFavorites();
  }

  void toggleFavorite(String fieldName) {
    if (_favorites.contains(fieldName)) {
      _favorites.remove(fieldName);
    } else {
      _favorites.add(fieldName);
    }
    notifyListeners();
    _saveToPrefs();
  }

  Future<void> loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    _favorites = Set<String>.from(prefs.getStringList('favorites') ?? []);
    notifyListeners();
  }

  void _saveToPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList('favorites', _favorites.toList());
  }

  void clearFavorites() {
    _favorites.clear();
    notifyListeners();
  }
}
