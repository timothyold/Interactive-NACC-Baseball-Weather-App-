// models/field.dart
class Field {
  final String name;
  final double lat;
  final double lon;
  final double facing;
  final String location;

  Field(
      {required this.name,
      required this.lat,
      required this.lon,
      required this.facing,
      required this.location});
}

// models/weather.dart
class Weather {
  final double windDirection;
  final double windSpeed;
  final double temperature;

  Weather({
    required this.windDirection,
    required this.windSpeed,
    required this.temperature,
  });
}

final List<Field> fieldsData = [
  Field(
      name: "Illinois Tech Ed Glancy Field",
      location: "Chicago, IL",
      lat: 41.83916,
      lon: -87.62423,
      facing: 0.7853981),
  Field(
      name: "Aurora University Jim Schmid Field",
      location: "Montgomery, IL",
      lat: 41.7267,
      lon: -88.386,
      facing: 0.78539816),
  Field(
      name: "Benedictine University Baseball Field",
      location: "Lisle, IL",
      lat: 41.7789,
      lon: -88.0972,
      facing: 2.35619449),
  Field(
      name: "Concordia University Chicago Cougar Field",
      location: "River Forest, IL",
      lat: 41.9008,
      lon: -87.8093,
      facing: 0.75049158),
  Field(
      name: "Concordia University Wisconsin Kapco Park",
      location: "Mequon, WI",
      lat: 43.2565,
      lon: -87.9137,
      facing: 0.62831853),
  Field(
      name: "Dominican University Wintrust Field",
      location: "Schaumburg, IL",
      lat: 41.9929,
      lon: -88.1175,
      facing: 0.6981317),
  Field(
      name: "Edgewood College Stampfl Field",
      location: "Verona, WI",
      lat: 42.9926,
      lon: -89.5218,
      facing: 0.66322512),
  Field(
      name: "Lakeland University Muskie Field",
      location: "Sheboygan County, WI",
      lat: 43.8442,
      lon: -87.8831,
      facing: 0),
  Field(
      name: "Marian University Herr-Baker Field",
      location: "Fond du Lac, WI",
      lat: 43.7774,
      lon: -88.4008,
      facing: 0.80285146),
  Field(
      name: "MSOE Raiders Stadium",
      location: "Glendale, WI",
      lat: 43.1312,
      lon: -87.9405,
      facing: 5.53269373),
  Field(
      name: "Rockford University Rivets Stadium",
      location: "Loves Park, IL",
      lat: 42.3247,
      lon: -88.9546,
      facing: 0.78539816),
  Field(
      name: "St. Norbert College Larry Van Alstine Field",
      location: "De Pere, WI",
      lat: 44.4367,
      lon: -88.0753,
      facing: 5.67232007),
  Field(
      name: "Wisconsin Lutheran College Neumann Family Baseball Field",
      location: "Chicago, IL",
      lat: 43.0487,
      lon: -88.0439,
      facing: 1.01229097),
];
