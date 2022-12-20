

# fl_geocoder

[![style: very good analysis][very_good_analysis_badge]][very_good_analysis_link][![License: MIT][license_badge]][license_link]

A Flutter package for **Forward** and **Reverse** geocoding using Google Maps Platform Geocoding API. This package provides a more detailed data from API's response such as `Address Components`, `Geometry`, `Place Id`, and `Status Codes`.

[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[license_link]: https://opensource.org/licenses/MIT
[very_good_analysis_badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis

## 🎯 Pre-requisites
 Before you start using this package, you need a project with a billing account and the Geocoding API enabled at [Google Maps Platform](https://developers.google.com/maps).

## 🔨 Installation
```yaml
dependencies:
  fl_geocoder: ^0.0.1
```

### ⚙ Import

```dart
import 'package:fl_geocoder/fl_geocoder.dart';
```

## 🕹️ Usage

Create an instance of `FlGeocoder` to access the functionalities available for geocoding. 
You have to pass a valid API key in order for the functions to work as expected. On the other hand, this package provides an error messages where you can debug and found out the cause of it.
```dart
final geocoder = const FlGeocoder('YOUR-API-KEY');
```
```dart
  GestureDetector(
    onTap: () async {
        final coordinates = Location(40.714224, -73.961452);
        final results = await geocoder.findAddressesFromLocationCoordinates(
          location: coordinates,
          useDefaultResultTypeFilter: isFiltered,
          // resultType: 'route', // Optional. For custom filtering.
        );
    },
    child: Container(
      padding: const EdgeInsets.symmetric(
          horizontal: 8.0, vertical: 4.0),
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: const BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.all(Radius.circular(5.0))),
      child: Text('Search',
          style: const TextStyle(color: Colors.white)),
    ),
  ),
```
### FlGeocoder
 **`FlGeocoder`** class contains three different functionalities for geocoding.
 
 #### 1. `findAddressesFromLocationCoordinates` 
Search corresponding addresses from given [Location].

| Arguments | Type| Description |
|:---:|:---:|:---|
| **location** | Location |  Required values specifying the location for which you wish to obtain the closest, human-readable address.|
| **resultType** | String? |  A filter of one or more address types, separated by a pipe (\|). If the parameter contains multiple address types, the API returns all addresses that match any of the types.|
| **useDefaultResultTypeFilter** | bool | An optinal argument that checks whether to use the default filter type provided by this package which are `street_number|route`. Defaults to `true`. |
<img src="https://github.com/fernan542/fl_geocoder/blob/main/screenshots/geocode-reverse.gif?raw=true" width="200"/>

 #### 2. `findAddressesFromAddress` 
Search for available list of address that matches the given string [address] query.

| Arguments | Type| Description |
|:---:|:---:|:---|
| **address** | String |  Required argument where the geocoding specific area will be based.|
<img src="https://github.com/fernan542/fl_geocoder/blob/main/screenshots/geocode-address-query.gif?raw=true" width="200"/>

 #### 2. `findAddressesFromPlaceId` 
Search for available list of address that matches the given place id.

| Arguments | Type| Description |
|:---:|:---:|:---|
| **id** | String | Required argument place [id]s uniquely identify a place in the Google Places database and on Google Maps. |
<img src="https://github.com/fernan542/fl_geocoder/blob/main/screenshots/geocode-place-id.gif?raw=true" width="200"/>

## ❌ Error Handling
`GeocodeFailure` gives you the human-readable explanation for the error that you encountered.

```dart
    final latitude = double.parse(latitudeController.text);
    final longitude = double.parse(longitudeController.text);
    final coordinates = Location(latitude, longitude);
      try {
        final results =
            await widget.geocoder.findAddressesFromLocationCoordinates(
          location: coordinates,
          useDefaultResultTypeFilter: isFiltered,
        );
      } on GeocodeFailure catch (e) {
        // Do some debugging or show an error message.
        log(e.message ?? 'Unknown error occured.');
      } catch (_) {
        // Do some debugging or show an error message.
        log('Generic failure occured.');
      }
```

## 🐞 Bugs/Requests

If you encounter any problems feel open an issue. If you feel the library is missing a feature, please raise a ticket on Github and we'll look into it. Pull request are also welcome.

## 📃 License

MIT License