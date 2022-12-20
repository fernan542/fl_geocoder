import 'package:fl_geocoder/src/models/json_map.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'address_component.g.dart';

/// {@template address_component}
/// A separate component applicable to the address being searched.
/// {@endtemplate}
@immutable
@JsonSerializable(fieldRename: FieldRename.snake)
class AddressComponent {
  /// {@macro address_component}
  const AddressComponent({
    this.shortName,
    required this.longName,
    required this.types,
  });

  /// s an abbreviated textual name for the address component, if available.
  /// For example, an address component for the state of Alaska may have
  /// a long_name of "Alaska" and a short_name of "AK" using the
  /// 2-letter postal abbreviation.
  final String? shortName;

  /// The full text description or name of the address component as
  /// returned by the Geocoder.
  final String longName;

  /// [List] indicating the types of the address component.
  @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  final List<AddressComponentTypes?> types;

  /// Deserializes the given [JsonMap] into a [AddressComponent].
  static AddressComponent fromJson(JsonMap json) =>
      _$AddressComponentFromJson(json);

  /// Converts this [AddressComponent] into a [JsonMap].
  JsonMap toJson() => _$AddressComponentToJson(this);
}

/// {@template address_component_types}
/// Addresses may have multiple types. The types may be considered 'tags'.
/// For example, many cities are tagged with the political and
/// the locality type.
/// {@endtemplate}
@JsonEnum(fieldRename: FieldRename.snake)
enum AddressComponentTypes {
  /// Indicates the precise street number.
  streetNumber,

  /// Indicates a precise street address.
  streetAddress,

  /// Indicates a named route (such as "US 101")
  route,

  /// Indicates a first-order civil entity below the country level.
  /// Within the United States, these administrative levels are states.
  /// Not all nations exhibit these administrative levels.
  /// In most cases, administrative_area_level_1 short names will closely
  /// match ISO 3166-2 subdivisions and other widely circulated lists;
  /// however this is not guaranteed as our geocoding results are based
  /// on a variety of signals and location data.
  @JsonValue('administrative_area_level_1')
  administrativeAreaLevel1,

  /// Indicates a second-order civil entity below the country level.
  /// Within the United States, these administrative levels are counties.
  /// Not all nations exhibit these administrative levels.
  @JsonValue('administrative_area_level_2')
  administrativeAreaLevel2,

  /// Indicates an incorporated city or town political entity.
  locality,

  /// Indicates a first-order civil entity below a locality.
  sublocality,

  /// Indicates a postal code as used to address postal mail within the country.
  postalCode,

  /// Indicates the national political entity, and is typically the
  /// highest order type returned by the Geocoder.
  country,
}
