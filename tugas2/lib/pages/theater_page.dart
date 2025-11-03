import 'package:flutter/material.dart';

class TheaterPage extends StatelessWidget {
  final String city;

  const TheaterPage({super.key, required this.city});

  
  Map<String, List<String>> getTheaters() {
    return {
      'Jakarta': [
        'XXI Plaza Indonesia',
        'CGV Grand Indonesia',
        'Cinepolis Senayan City',
        'XXI Kota Kasablanka',
        'Flix Cinema PIK'
      ],
      'Medan': [
        'XI Cinema',
        'Pondok Kelapa 21',
        'CGV Medan Mall',
        'Cinepolis Sun Plaza',
        'CP Mall',
        'Hermes Palace'
      ],
      'Bandung': [
        'XXI Ciwalk',
        'CGV Paris Van Java',
        'Cinepolis Istana Plaza',
        'Flix Festival Citylink'
      ],
      'Bali': [
        'XXI Beachwalk',
        'CGV Bali Galeria',
        'Cinepolis Level 21',
        'Denpasar Cineplex'
      ],
      'Makassar': [
        'XXI Panakkukang',
        'CGV Trans Studio',
        'Cinepolis Mall Ratu Indah',
        'Studio XXI GTC'
      ],
    };
  }

  @override
  Widget build(BuildContext context) {
    final theaters = getTheaters()[city] ?? [];

    return Scaffold(
      appBar: AppBar(
        title: Text('Theaters in $city'),
      ),
      body: theaters.isEmpty
          ? const Center(
              child: Text(
                'Daftar bioskop di kota ini akan ditampilkan di sini.',
                style: TextStyle(fontSize: 16),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: theaters.length,
              itemBuilder: (context, index) {
                final theater = theaters[index];
                return Card(
                  elevation: 2,
                  margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                  child: ListTile(
                    title: Text(
                      theater,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    trailing: const Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Kamu memilih $theater di $city'),
                          duration: const Duration(seconds: 2),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
    );
  }
}
