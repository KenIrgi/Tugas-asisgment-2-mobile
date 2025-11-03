import 'package:flutter/material.dart';
import 'pages/login_page.dart';
import 'pages/signup_page.dart';
import 'pages/city_page.dart';
import 'pages/theater_page.dart';
import 'pages/movie_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tugas 2 Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Poppins',
        // warna latar (AARRGGBB) — contoh: alpha FF + warna #F8EFFB
        scaffoldBackgroundColor: const Color(0xFFF8EFFB),
      ),

      // halaman awal
      initialRoute: '/login',

      // rute biasa (tanpa argumen)
      routes: {
        '/login': (context) => const LoginPage(),
        '/signup': (context) => const SignUpPage(), // <-- PENTING: cocok dengan class SignUpPage
        '/city': (context) => const CityPage(),
        '/movie': (context) => const MoviePage(),
      },

      // onGenerateRoute untuk rute yang butuh argumen (mis. ke halaman bioskop/theater)
      onGenerateRoute: (settings) {
        if (settings.name == '/bioskop' || settings.name == '/theater') {
          final args = settings.arguments;
          final cityName = args is String ? args : 'Unknown';
          return MaterialPageRoute(
            builder: (context) => TheaterPage(city: cityName),
            settings: settings,
          );
        }
        return null; // biarkan Flutter handle rute lain
      },
    );
  }
}
