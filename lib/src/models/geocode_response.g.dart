// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geocode_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeocodeResponse _$GeocodeResponseFromJson(Map<String, dynamic> json) =>
    GeocodeResponse(
      status: $enumDecode(_$GeocodingStatusCodeEnumMap, json['status']),
      results: (json['results'] as List<dynamic>?)
              ?.map((e) => Result.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$GeocodeResponseToJson(GeocodeResponse instance) =>
    <String, dynamic>{
      'results': instance.results,
      'status': _$GeocodingStatusCodeEnumMap[instance.status]!,
    };

const _$GeocodingStatusCodeEnumMap = {
  GeocodingStatusCode.ok: 'OK',
  GeocodingStatusCode.zeroResults: 'ZERO_RESULTS',
  GeocodingStatusCode.overDailyLimit: 'OVER_DAILY_LIMIT',
  GeocodingStatusCode.overQueryLimit: 'OVER_QUERY_LIMIT',
  GeocodingStatusCode.requestDenied: 'REQUEST_DENIED',
  GeocodingStatusCode.invalidRequest: 'INVALID_REQUEST',
  GeocodingStatusCode.unknownError: 'UNKNOWN_ERROR',
};
