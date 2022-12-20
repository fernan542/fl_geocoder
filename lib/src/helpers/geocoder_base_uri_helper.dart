import 'package:fl_geocoder/fl_geocoder.dart';
import 'package:fl_geocoder/src/constants.dart';

/// Generates Geocode base [Uri] that can be used on fetching placemark.
Uri generateGeocodeBaseUri({
  required String apiKey,
  Location? location,
  String? resultType,
  String? address,
  String? region,
  String? placeId,
}) {
  final parameters = {
    if (location != null) 'latlng': location.asParameter,
    if (resultType != null) 'result_type': resultType,
    if (address != null) 'address': Uri.encodeComponent(address),
    if (region != null) 'region': region,
    if (placeId != null) 'place_id': placeId,
    'key': apiKey,
  };

  return Uri(
    scheme: kHttpsScheme,
    host: kGeocodeHost,
    path: kGeocodePath,
    queryParameters: parameters,
  );
}

extension _LocationToParameter on Location {
  String get asParameter => '$latitude, $longitude';
}
