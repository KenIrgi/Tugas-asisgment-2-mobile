import 'package:flutter/material.dart';
import 'theater_page.dart';

class CityPage extends StatelessWidget {
  const CityPage({super.key});

  final List<String> cities = const ['Jakarta', 'Medan', 'Bandung', 'Bali', 'Makassar'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose City'),
      ),
      body: ListView.builder(
        itemCount: cities.length,
        itemBuilder: (context, index) {
          final city = cities[index];
          return ListTile(
            title: Text(city),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TheaterPage(city: city),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
