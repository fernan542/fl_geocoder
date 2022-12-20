import 'package:example/demo/utils.dart';
import 'package:example/demo/views/demo_page.dart';
import 'package:fl_geocoder/fl_geocoder.dart';
import 'package:flutter/material.dart';

const myApiKey = 'YOUR-API-KEY-HERE';

void main() {
  final geocoder = FlGeocoder(myApiKey);
  runApp(MyApp(geocoder));
}

class MyApp extends StatelessWidget {
  const MyApp(this.geocoder, {Key? key}) : super(key: key);
  final FlGeocoder geocoder;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      scaffoldMessengerKey: globalScaffoldMessengerKey,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DemoPage(geocoder),
    );
  }
}
