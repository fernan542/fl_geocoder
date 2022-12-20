import 'package:collection/collection.dart';
import 'package:fl_geocoder/fl_geocoder.dart';
import 'package:fl_geocoder/src/models/json_map.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'result.g.dart';

/// {@template result}
/// Data fetched if the geocoder returned an `ok` status.
///
/// Composed of list of [AddressComponent]s where the user can
/// call each of the corresponding result types.
///
/// A typical result contains the following [fields](https://developers.google.com/maps/documentation/geocoding/requests-geocoding#results).
/// {@endtemplate}
@immutable
@JsonSerializable(fieldRename: FieldRename.snake)
class Result {
  /// {@macro result}
  const Result({
    required this.geometry,
    this.addressComponents = const [],
    this.formattedAddress,
    this.placeId,
  });

  /// List containing the separate components applicable to this address.
  final List<AddressComponent> addressComponents;

  /// {@macro geometry}
  final Geometry geometry;

  /// Single string containing the human-readable address of this location.
  final String? formattedAddress;

  /// Unique identifier for a place in the Google Places database
  /// and on Google Maps.
  final String? placeId;

  /// Deserializes the given [JsonMap] into a [Result].
  static Result fromJson(JsonMap json) => _$ResultFromJson(json);

  /// Converts this [Result] into a [JsonMap].
  JsonMap toJson() => _$ResultToJson(this);

  /// Convenient alternative getter for formatted street address.
  String? get formattedStreet {
    if (streetAddress != null) return streetAddress!.longName;

    final sb = StringBuffer();
    if (streetNumber != null) sb.write('${streetNumber!.longName} ');
    if (route != null) sb.write(route!.longName);

    return sb.toString();
  }

  /// {@macro address_component_types}
  AddressComponent? get streetNumber => addressComponents.firstWhereOrNull(
        (c) => c.types.contains(AddressComponentTypes.streetNumber),
      );

  /// {@macro address_component_types}
  ///
  /// Can be used as street.
  AddressComponent? get streetAddress => addressComponents.firstWhereOrNull(
        (c) => c.types.contains(AddressComponentTypes.streetAddress),
      );

  /// {@macro address_component_types}
  ///
  /// Can be used as street if `streetAddress` is not available.
  AddressComponent? get route => addressComponents.firstWhereOrNull(
        (c) => c.types.contains(AddressComponentTypes.route),
      );

  /// {@macro address_component_types}
  ///
  /// Can be used as state.
  AddressComponent? get administrativeAreaLevel1 =>
      addressComponents.firstWhereOrNull(
        (c) => c.types.contains(AddressComponentTypes.administrativeAreaLevel1),
      );

  /// {@macro address_component_types}
  ///
  /// Can be used as state if `administrativeAreaLevel1` is not available.
  AddressComponent? get administrativeAreaLevel2 =>
      addressComponents.firstWhereOrNull(
        (c) => c.types.contains(AddressComponentTypes.administrativeAreaLevel2),
      );

  /// {@macro address_component_types}
  ///
  /// Can be used as city.
  AddressComponent? get locality => addressComponents.firstWhereOrNull(
        (c) => c.types.contains(AddressComponentTypes.locality),
      );

  /// {@macro address_component_types}
  ///
  /// Can be used as city if `locality` is not available.
  AddressComponent? get sublocality => addressComponents.firstWhereOrNull(
        (c) => c.types.contains(AddressComponentTypes.sublocality),
      );

  /// {@macro address_component_types}
  AddressComponent? get postalCode => addressComponents.firstWhereOrNull(
        (c) => c.types.contains(AddressComponentTypes.postalCode),
      );

  /// {@macro address_component_types}
  AddressComponent? get country => addressComponents.firstWhereOrNull(
        (c) => c.types.contains(AddressComponentTypes.country),
      );
}
