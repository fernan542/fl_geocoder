import 'package:fl_geocoder/src/models/json_map.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'geometry.g.dart';

/// {@template geometry}
/// Google Maps API geometric data on the surface of the earth.
/// {@endtemplate}
@immutable
@JsonSerializable()
class Geometry {
  /// {@macro geometry}
  const Geometry({
    required this.location,
  });

  /// {@macro location}
  final Location location;

  /// Deserializes the given [JsonMap] into a [Geometry].
  static Geometry fromJson(JsonMap json) => _$GeometryFromJson(json);

  /// Converts this [Geometry] into a [JsonMap].
  JsonMap toJson() => _$GeometryToJson(this);
}

/// {@template location}
/// The geocoded latitude, longitude value.
/// {@endtemplate}
@immutable
@JsonSerializable()
class Location {
  /// {@macro location}
  const Location(this.latitude, this.longitude);

  /// The latitude in degrees between -90.0 and 90.0, both inclusive.
  @JsonKey(name: 'lat')
  final double latitude;

  /// The longitude in degrees between -180.0 (inclusive) and 180.0 (exclusive).
  @JsonKey(name: 'lng')
  final double longitude;

  /// Deserializes the given [JsonMap] into a [Location].
  static Location fromJson(JsonMap json) => _$LocationFromJson(json);

  /// Converts this [Location] into a [JsonMap].
  JsonMap toJson() => _$LocationToJson(this);

  @override
  String toString() => '$latitude, $longitude';
}
