import 'package:example/demo/views/views.dart';
import 'package:fl_geocoder/fl_geocoder.dart';
import 'package:flutter/material.dart';

const borderRadius = BorderRadius.all(Radius.circular(8));

const fieldBorder = OutlineInputBorder(
  borderRadius: borderRadius,
  borderSide: BorderSide(color: Colors.blue, width: 2),
);

class DemoPage extends StatelessWidget {
  const DemoPage(this.geocoder, {Key? key}) : super(key: key);

  final FlGeocoder geocoder;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          'Demo',
          style: TextStyle(color: Colors.black, fontSize: 40),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        alignment: Alignment.center,
        child: PageView.builder(
          itemCount: 4,
          itemBuilder: (context, index) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Builder(
                  builder: (context) {
                    if (index == 0) return ReverseGeocodingView(geocoder);
                    if (index == 1) return GeocodingQueryView(geocoder);
                    if (index == 2) return GeocodingPlaceIdView(geocoder);

                    return Container();
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
