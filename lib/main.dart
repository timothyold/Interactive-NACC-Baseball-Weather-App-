import 'package:flutter/material.dart';
import 'package:mp5/Views/favorites.dart';
import 'package:provider/provider.dart';
import 'package:mp5/providers/favorites_provider.dart'; // Assuming you have this provider
import 'package:mp5/providers/weather_provider.dart'; // Assuming you have this provider

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Setup MultiProvider for managing state across the application
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => FavoritesProvider()),
        ChangeNotifierProvider(create: (context) => WeatherProvider()),
      ],
      child: MaterialApp(
        title: 'Baseball Weather App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const FavoritesScreen(),
        // Setup the initial route to FieldSelectionScreen
      ),
    );
  }
}
