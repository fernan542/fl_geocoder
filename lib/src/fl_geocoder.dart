import 'dart:convert';
import 'dart:io';

import 'package:fl_geocoder/fl_geocoder.dart';
import 'package:fl_geocoder/src/constants.dart';
import 'package:fl_geocoder/src/geocoder.dart';
import 'package:fl_geocoder/src/helpers/helpers.dart';
import 'package:fl_geocoder/src/models/json_map.dart';

/// {@template geocode_failure}
/// Thrown during the geocoding process if a failure occurs with an optional
/// error [message].
/// {@endtemplate}
class GeocodeFailure implements Exception {
  /// {@macro geocode_failure}
  GeocodeFailure([this.message = '']);

  /// The associated error message.
  final String? message;
}

/// {@template fl_geocoder}
/// Forward and reverse geocoding using Google Maps Platform Geocoding API.
///
/// The term geocoding generally refers to translating a human-readable
/// address into a location on a map. The process of doing the opposite,
/// translating a location on the map into a human-readable address,
/// is known as reverse geocoding.
/// {@endtemplate}
class FlGeocoder extends Geocoder {
  /// {@macro fl_geocoder}
  FlGeocoder(this.apiKey) : _httpClient = HttpClient();

  final HttpClient _httpClient;

  /// Your application's API key. This key identifies your application
  /// for purposes of quota management.
  ///
  /// Learn how to [get a key](https://developers.google.com/maps/documentation/geocoding/get-api-key).
  final String apiKey;

  @override
  Future<List<Result>> findAddressesFromLocationCoordinates({
    required Location location,
    bool useDefaultResultTypeFilter = true,
    String? resultType,
  }) async {
    final uri = generateGeocodeBaseUri(
      apiKey: apiKey,
      location: location,
      resultType: useDefaultResultTypeFilter //
          ? kGeocodeDefaultResultType
          : resultType,
    );

    try {
      final request = await _httpClient.getUrl(uri);
      final response = await request.close();
      final responseBody = await utf8.decoder.bind(response).join();
      final data = jsonDecode(responseBody);

      if (data != null) {
        final geocodeResponse = GeocodeResponse.fromJson(data as JsonMap);
        if (geocodeResponse.status.isOk) return geocodeResponse.results;
        throw GeocodeFailure(geocodeResponse.status.explanation);
      }

      throw GeocodeFailure('Network connection error.');
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<List<Result>> findAddressesFromAddress(String address) async {
    final uri = generateGeocodeBaseUri(apiKey: apiKey, address: address);

    try {
      final request = await _httpClient.getUrl(uri);
      final response = await request.close();
      final responseBody = await utf8.decoder.bind(response).join();
      final data = jsonDecode(responseBody);

      if (data != null) {
        final geocodeResponse = GeocodeResponse.fromJson(data as JsonMap);
        if (geocodeResponse.status.isOk) return geocodeResponse.results;
        throw GeocodeFailure(geocodeResponse.status.explanation);
      }

      throw GeocodeFailure('Network connection error.');
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<List<Result>> findAddressesFromPlaceId(String id) async {
    final uri = generateGeocodeBaseUri(apiKey: apiKey, placeId: id);

    try {
      final request = await _httpClient.getUrl(uri);
      final response = await request.close();
      final responseBody = await utf8.decoder.bind(response).join();
      final data = jsonDecode(responseBody);

      if (data != null) {
        final geocodeResponse = GeocodeResponse.fromJson(data as JsonMap);
        if (geocodeResponse.status.isOk) return geocodeResponse.results;
        throw GeocodeFailure(geocodeResponse.status.explanation);
      }

      throw GeocodeFailure('Network connection error.');
    } catch (_) {
      rethrow;
    }
  }
}
