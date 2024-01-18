// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mp5/Views/Field.dart';
import 'package:mp5/Views/Menu.dart';
import 'package:mp5/main.dart';
import 'package:mp5/models/models.dart';
import 'package:mp5/providers/favorites_provider.dart';
import 'package:mp5/providers/weather_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockWeatherProvider extends WeatherProvider {
  Weather? _weather;

  @override
  Weather? get weather => _weather;

  set weather(Weather? value) {
    _weather = value;
    notifyListeners();
  }

  @override
  Future<void> fetchWeather(double lat, double lon) async {
    // Simulate delay
    await Future.delayed(const Duration(milliseconds: 100));

    // Set predefined weather data
    weather = Weather(
      windDirection: 90.0, // Mock wind direction
      windSpeed: 10.0, // Mock wind speed
      temperature: 25.0, // Mock temperature
    );
  }
}

void main() {
  setUp(() async {
    SharedPreferences.setMockInitialValues({});
  });

  group('Unit Tests', () {
    // Unit Test 1 for Non-null Field Name
    test('Field constructor assigns values correctly', () {
      var field = Field(
          name: 'Test Field',
          lat: 40.0,
          lon: -74.0,
          facing: 45.0,
          location: 'Test Location');

      expect(field.name, 'Test Field');
      expect(field.lat, 40.0);
      expect(field.lon, -74.0);
      expect(field.facing, 45.0);
      expect(field.location, 'Test Location');
    });

    // Unit Test 2 for Non-null Field Name
    test('Field should have a non-null name', () {
      var field = Field(
          name: 'Test Field',
          lat: 40.0,
          lon: -74.0,
          facing: 45.0,
          location: 'Test Location');
      expect(field.name, isNotNull);
    });

    // Unit Test 3 for Valid Latitude and Longitude
    test('Field latitude and longitude should be valid', () {
      var field = Field(
          name: 'Test Field',
          lat: 40.0,
          lon: -74.0,
          facing: 45.0,
          location: 'Test Location');
      expect(field.lat, greaterThanOrEqualTo(-90.0));
      expect(field.lat, lessThanOrEqualTo(90.0));
      expect(field.lon, greaterThanOrEqualTo(-180.0));
      expect(field.lon, lessThanOrEqualTo(180.0));
    });

    // Unit Test 4 for Correct Field Location
    test('Field location should be correct', () {
      var field = Field(
          name: 'Test Field',
          lat: 40.0,
          lon: -74.0,
          facing: 45.0,
          location: 'Test Location');
      expect(field.location, 'Test Location');
    });

    // Unit Test 5 for Valid Facing Value
    test('Field facing value should be valid', () {
      var field = Field(
          name: 'Test Field',
          lat: 40.0,
          lon: -74.0,
          facing: 45.0,
          location: 'Test Location');
      expect(field.facing, isIn([0, 45.0, 90, 135, 180, 225, 270, 315]));
    });
  });
  group('Integration Tests', () {
    TestWidgetsFlutterBinding.ensureInitialized();

    // Mock SharedPreferences before the tests

    // Integration Test 1
    testWidgets('Navigation Test from Favorites to Field Selection',
        (WidgetTester tester) async {
      // Build the app
      await tester.pumpWidget(const MyApp());

      // navigates to FieldSelectionScreen

      await tester.tap(find.byType(ElevatedButton).first);
      await tester.pumpAndSettle();

      // Verify FieldSelectionScreen is displayed
      expect(find.byType(FieldSelectionScreen), findsOneWidget);
    });
    // Integration Test 2
    testWidgets('Favorite fields are added', (WidgetTester tester) async {
      // Build the app
      await tester.pumpWidget(const MyApp());

      await tester.tap(find.byType(ElevatedButton).first);
      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(Icons.star_border).first);
      await tester.pumpAndSettle();

      await tester.tap(find.byType(FloatingActionButton).first);
      await tester.pumpAndSettle();

      expect(find.byType(ListTile), findsOneWidget);
    });
    // Integration Test 3
    testWidgets('Favorite fields are removed', (WidgetTester tester) async {
      // Build the app
      await tester.pumpWidget(const MyApp());
      //navigate to main list
      await tester.tap(find.byType(ElevatedButton).first);
      await tester.pumpAndSettle();
      //add a favorite
      await tester.tap(find.byIcon(Icons.star_border).first);
      await tester.pumpAndSettle();
      //navigate to favorites
      await tester.tap(find.byType(FloatingActionButton).first);
      await tester.pumpAndSettle();
      //verify favorite was added
      expect(find.byType(ListTile), findsOneWidget);
      //navigate back to main menu
      await tester.tap(find.byType(FloatingActionButton).first);
      await tester.pumpAndSettle();
      //remove favorite
      await tester.tap(find.byIcon(Icons.star).first);
      await tester.pumpAndSettle();
      // navigate back to favorites
      await tester.tap(find.byType(FloatingActionButton).first);
      await tester.pumpAndSettle();
      // verify there are no favorites
      expect(find.byType(ListTile), findsNothing);
    });
    // Integration Test 4
    testWidgets('Navigation from main menu to field screen',
        (WidgetTester tester) async {
      // Build the app
      await tester.pumpWidget(const MyApp());

      // navigates to FieldSelectionScreen

      await tester.tap(find.byType(ElevatedButton).first);
      await tester.pumpAndSettle();
      //Navigate to FieldScreen
      await tester.tap(find.byType(ListTile).first);
      await tester.pumpAndSettle();

      // Verify FieldScreen is displayed
      expect(find.byType(FieldScreen), findsOneWidget);
    });
    // Integration Test 5

    testWidgets('Navigation Test from field screen to main menu',
        (WidgetTester tester) async {
      // Build the app
      await tester.pumpWidget(const MyApp());

      // navigates to FieldSelectionScreen

      await tester.tap(find.byType(ElevatedButton).first);
      await tester.pumpAndSettle();
      //Navigates to FieldScreen
      await tester.tap(find.byType(ListTile).first);
      await tester.pumpAndSettle();
      //Navigates back to FieldSelection Screen
      await tester.tap(find.byTooltip('Back').first);
      await tester.pumpAndSettle();

      // Verify FieldScreen is displayed
      expect(find.byType(FieldSelectionScreen), findsOneWidget);
    });
  });
  group('Widget Tests', () {
    TestWidgetsFlutterBinding.ensureInitialized();

    final mockFields = [
      Field(
          name: "Ed Glancy Field",
          location: "Chicago, IL",
          lat: 41.83917,
          lon: -87.62422,
          facing: 45),
    ];

    setUp(() {
      SharedPreferences.setMockInitialValues({
        'testFields': mockFields,
      });
    });
    // Widget test 1
    testWidgets('Test display wind speed in FieldScreen',
        (WidgetTester tester) async {
      final field = fieldsData.first;

      await tester.pumpWidget(
        MaterialApp(
          home: ChangeNotifierProvider<WeatherProvider>(
            create: (_) => MockWeatherProvider(),
            child: FieldScreen(field: field),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.textContaining('Wind Speed:'), findsOneWidget);
    });
    // Widget test 2
    testWidgets('Test display temperture in FieldScreen',
        (WidgetTester tester) async {
      final field = fieldsData.first;

      await tester.pumpWidget(
        MaterialApp(
          home: ChangeNotifierProvider<WeatherProvider>(
            create: (_) => MockWeatherProvider(),
            child: FieldScreen(field: field),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.textContaining('Temperature:'), findsOneWidget);
    });
    //Widget test 3
    testWidgets('Test display wind arrow in FieldScreen',
        (WidgetTester tester) async {
      final field = fieldsData.first;

      await tester.pumpWidget(
        MaterialApp(
          home: ChangeNotifierProvider<WeatherProvider>(
            create: (_) => MockWeatherProvider(),
            child: FieldScreen(field: field),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.arrow_upward), findsOneWidget);
    });
    //Widget test 4
    testWidgets('Test display a list of field names',
        (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(
        MaterialApp(
          home: ChangeNotifierProvider<FavoritesProvider>(
            create: (context) => FavoritesProvider(),
            child: FieldSelectionScreen(fields: mockFields),
          ),
        ),
      );

      // Verify that FieldSelectionScreen shows fields
      for (final field in mockFields) {
        expect(find.text(field.name), findsOneWidget);
      }
    });

    // Widget Test 5: Check if FieldSelectionScreen displays a list of field locations
    testWidgets('Test display a list of field locations',
        (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(
        MaterialApp(
          home: ChangeNotifierProvider<FavoritesProvider>(
            create: (context) => FavoritesProvider(),
            child: FieldSelectionScreen(fields: mockFields),
          ),
        ),
      );

      for (final field in mockFields) {
        expect(find.text(field.location), findsOneWidget);
      }
    });
  });
}
