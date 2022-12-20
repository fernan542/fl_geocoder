// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_component.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressComponent _$AddressComponentFromJson(Map<String, dynamic> json) =>
    AddressComponent(
      shortName: json['short_name'] as String?,
      longName: json['long_name'] as String,
      types: (json['types'] as List<dynamic>)
          .map((e) => $enumDecodeNullable(_$AddressComponentTypesEnumMap, e,
              unknownValue: JsonKey.nullForUndefinedEnumValue))
          .toList(),
    );

Map<String, dynamic> _$AddressComponentToJson(AddressComponent instance) =>
    <String, dynamic>{
      'short_name': instance.shortName,
      'long_name': instance.longName,
      'types':
          instance.types.map((e) => _$AddressComponentTypesEnumMap[e]).toList(),
    };

const _$AddressComponentTypesEnumMap = {
  AddressComponentTypes.streetNumber: 'street_number',
  AddressComponentTypes.streetAddress: 'street_address',
  AddressComponentTypes.route: 'route',
  AddressComponentTypes.administrativeAreaLevel1: 'administrative_area_level_1',
  AddressComponentTypes.administrativeAreaLevel2: 'administrative_area_level_2',
  AddressComponentTypes.locality: 'locality',
  AddressComponentTypes.sublocality: 'sublocality',
  AddressComponentTypes.postalCode: 'postal_code',
  AddressComponentTypes.country: 'country',
};
