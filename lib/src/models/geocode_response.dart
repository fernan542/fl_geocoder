import 'package:fl_geocoder/fl_geocoder.dart';
import 'package:fl_geocoder/src/models/json_map.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'geocode_response.g.dart';

/// {@template geocode_response}
/// Response from Google Maps Geocoding API.
/// {@endtemplate}
@immutable
@JsonSerializable(fieldRename: FieldRename.snake)
class GeocodeResponse {
  /// {@macro geocode_response}
  const GeocodeResponse({
    required this.status,
    this.results = const [],
  });

  /// {@macro result}
  final List<Result> results;

  /// {@macro geocoding_status_code}
  final GeocodingStatusCode status;

  /// Deserializes the given [JsonMap] into a [GeocodeResponse].
  static GeocodeResponse fromJson(JsonMap json) =>
      _$GeocodeResponseFromJson(json);

  /// Converts this [GeocodeResponse] into a [JsonMap].
  JsonMap toJson() => _$GeocodeResponseToJson(this);
}

/// {@template geocoding_status_code}
/// The field within the Geocoding response object contains the status of
/// the request, and may contain debugging information to help you
/// track down why reverse geocoding is not working.
/// {@endtemplate}
enum GeocodingStatusCode {
  /// Indicates that no errors occurred and at least one address was returned.
  @JsonValue('OK')
  ok,

  /// Indicates that the reverse geocoding was successful but returned
  /// no results. This may occur if the geocoder passed a
  /// latlng in a remote location.
  @JsonValue('ZERO_RESULTS')
  zeroResults,

  /// Indicates that there is something wrong with your account or project
  /// configurations.
  @JsonValue('OVER_DAILY_LIMIT')
  overDailyLimit,

  /// Indicates that you are over your quota.
  @JsonValue('OVER_QUERY_LIMIT')
  overQueryLimit,

  /// Indicates that the request was denied.
  /// Possibly because the request includes a result_type or
  /// location_type parameter but does not include an API key.
  @JsonValue('REQUEST_DENIED')
  requestDenied,

  /// Generally indicates one of the following:
  /// * The query (address, components or latlng) is missing.
  /// * An invalid result_type or location_type was given.
  @JsonValue('INVALID_REQUEST')
  invalidRequest,

  /// Indicates that the request could not be processed due to a server error.
  /// The request may succeed if you try again.
  @JsonValue('UNKNOWN_ERROR')
  unknownError;
}

/// Convenient extension for [GeocodingStatusCode].
extension GeocodingStatusCodeX on GeocodingStatusCode {
  /// Convenient explanation when showing status message.
  /// Copied from [Google Maps Platform](https://developers.google.com/maps/documentation/geocoding/requests-geocoding#StatusCodes).
  String get explanation {
    switch (this) {
      case GeocodingStatusCode.ok:
        return '''The address was successfully parsed and at least one geocode was returned.''';
      case GeocodingStatusCode.zeroResults:
        return '''Geocode was successful but returned no results.''';
      case GeocodingStatusCode.overDailyLimit:
        return '''There is something wrong with your account or project configuration.''';
      case GeocodingStatusCode.overQueryLimit:
        return '''Incoming requests are over your quota.''';
      case GeocodingStatusCode.requestDenied:
        return '''Request was denied. Please provide a valid API key.''';
      case GeocodingStatusCode.invalidRequest:
        return '''Query or parameters passed are invalid or missing. ''';
      case GeocodingStatusCode.unknownError:
        return '''Request could not be processed due to a server error. Please try again later.''';
    }
  }

  /// Checks whether the status is ok.
  bool get isOk => this == GeocodingStatusCode.ok;
}
