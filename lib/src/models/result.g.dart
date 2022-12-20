// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      geometry: Geometry.fromJson(json['geometry'] as Map<String, dynamic>),
      addressComponents: (json['address_components'] as List<dynamic>?)
              ?.map((e) => AddressComponent.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      formattedAddress: json['formatted_address'] as String?,
      placeId: json['place_id'] as String?,
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'address_components': instance.addressComponents,
      'geometry': instance.geometry,
      'formatted_address': instance.formattedAddress,
      'place_id': instance.placeId,
    };
