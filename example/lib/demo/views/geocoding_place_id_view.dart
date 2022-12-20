import 'dart:developer' as dev;

import 'package:example/demo/demo.dart';
import 'package:example/demo/utils.dart';
import 'package:fl_geocoder/fl_geocoder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GeocodingPlaceIdView extends StatefulWidget {
  const GeocodingPlaceIdView(this.geocoder, {Key? key}) : super(key: key);

  final FlGeocoder geocoder;

  @override
  State<GeocodingPlaceIdView> createState() => _GeocodingPlaceIdViewState();
}

class _GeocodingPlaceIdViewState extends State<GeocodingPlaceIdView> {
  late final TextEditingController controller;
  final addresses = <Result>[];
  bool isFiltered = false;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: 'ChIJeRpOeF67j4AR9ydy_PIzPuM');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const PreviewTitle(title: 'Geocode Place ID'),
        TextFormField(
          textInputAction: TextInputAction.done,
          enabled: true,
          controller: controller,
          decoration: const InputDecoration(
            labelText: 'Place ID',
            fillColor: Colors.white,
            filled: true,
            border: fieldBorder,
          ),
        ),
        kSpacer,
        Row(
          children: [
            Checkbox(
              value: isFiltered,
              onChanged: (value) => setState(() => isFiltered = value!),
            ),
            const Text('Filter results?'),
          ],
        ),
        kSpacer,
        Center(
          child: SubmitButton(
            onPressed: () async {
              final id = controller.text;
              try {
                final results =
                    await widget.geocoder.findAddressesFromPlaceId(id);

                addresses.clear();
                addresses.addAll(results);
                setState(() {});
              } on GeocodeFailure catch (e) {
                // Do some debugging or show an error message.
                dev.log(e.message ?? 'Unknown error occured.');
                showSnackBarColored(
                  e.message ?? 'Unknown error occured.',
                  SnackBarType.error,
                );
              } catch (e) {
                // Do some debugging or show an error message.
                dev.log(e.toString());
                showSnackBarColored(e.toString(), SnackBarType.error);
              }
            },
            text: 'Search',
          ),
        ),
        const PreviewTitle(title: 'Result/s:'),
        ListView.builder(
          shrinkWrap: true,
          itemCount: addresses.length,
          itemBuilder: (context, index) {
            final address = addresses[index];

            return InkWell(
              onTap: () async {
                await Clipboard.setData(
                  ClipboardData(text: address.geometry.location.toString()),
                );
                showSnackBarColored(
                  'Geometry copied.',
                  SnackBarType.information,
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  address.formattedAddress ?? '',
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
