import 'package:flutter/material.dart';

class MoviePage extends StatelessWidget {
  const MoviePage({super.key});

  @override
  Widget build(BuildContext context) {
    final movies = ["Aquaman 2", "Avatar 2", "Spiderman", "Venom"];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Movies"),
        backgroundColor: Colors.indigo,
      ),
      body: ListView.builder(
        itemCount: movies.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(movies[index]),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              // sementara belum ke detail page
            },
          );
        },
      ),
    );
  }
}
