import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class TheaterPage extends StatefulWidget {
  const TheaterPage({super.key});

  @override
  State<TheaterPage> createState() => _TheaterPageState();
}

class _TheaterPageState extends State<TheaterPage> {
  String _city = "Loading...";

  @override
  void initState() {
    super.initState();
    _getLocation();
  }

  Future<void> _getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      setState(() => _city = "GPS Off");
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        setState(() => _city = "Permission Denied");
        return;
      }
    }

    Position position = await Geolocator.getCurrentPosition();
    List<Placemark> placemarks = await placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );

    setState(() {
      _city = placemarks[0].locality ?? "Unknown";
    });
  }

  @override
  Widget build(BuildContext context) {
    final theaters = ["XI Cinema", "Pondok Kelapa 21", "CGV", "Cinepolis", "CP Mall", "Hermes"];

    return Scaffold(
      appBar: AppBar(
        title: const Text('THEATER'),
        backgroundColor: Colors.indigo[900],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ListTile(
              leading: const Icon(Icons.location_on, color: Colors.blue),
              title: Text(_city, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            const Divider(),
            Expanded(
              child: ListView.builder(
                itemCount: theaters.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(theaters[index]),
                      trailing: const Icon(Icons.keyboard_arrow_down),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
