// ignore_for_file: prefer_const_constructors
import 'package:fl_geocoder/fl_geocoder.dart';
import 'package:test/test.dart';

void main() {
  group('FlGeocoder', () {
    test('can be instantiated', () {
      expect(FlGeocoder(''), isNotNull);
    });
  });
}
