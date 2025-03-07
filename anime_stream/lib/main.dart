import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/splash_screen.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/streaming_screen.dart';

void main() {
  runApp(const AnimeStreamApp());
}

class AnimeStreamApp extends StatelessWidget {
  const AnimeStreamApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Anime Stream',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        textTheme: GoogleFonts.poppinsTextTheme(),
        scaffoldBackgroundColor: const Color(0xFF1A1A1A),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
        '/streaming': (context) => const StreamingScreen(),
      },
    );
  }
}
