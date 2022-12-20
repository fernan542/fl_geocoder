import 'package:fl_geocoder/fl_geocoder.dart';

/// Interface for reverse and forward geocoding.
abstract class Geocoder {
  /// Search corresponding addresses from given [Location].
  ///
  /// * `location` - Required values specifying the location
  /// for which you wish to obtain the closest, human-readable address.
  /// * `resultType` - A filter of one or more address types,
  /// separated by a pipe (|). If the parameter contains multiple address types,
  /// the API returns all addresses that match any of the types.
  /// * `useDefaultResultTypeFilter` - Uses the default filter type provided
  /// by this package which are `street_number|route`. Defaults to `true`.
  ///
  /// Note: If `useDefaultResultTypeFilter` is true, it overrides the
  /// provided `resultType`. If `useDefaultResultTypeFilter` is set to `false`
  /// and `resultType` is not provided, generally, the results are returned
  /// from most specific to least specific; If you wish to match a specific
  /// type of addresses, provide a `resultType` which can be viewed [here](https://developers.google.com/maps/documentation/geocoding/requests-reverse-geocoding#optional_parameters).
  Future<List<Result>> findAddressesFromLocationCoordinates({
    required Location location,
    String? resultType,
    bool useDefaultResultTypeFilter,
  });

  /// Search for available list of address that matches the
  /// given string [address] query.
  Future<List<Result>> findAddressesFromAddress(String address);

  /// Search for addresses that matches the given place [id].
  ///
  /// Place [id]s uniquely identify a place in the Google Places
  /// database and on Google Maps.
  Future<List<Result>> findAddressesFromPlaceId(String id);
}
