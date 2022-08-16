import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kcapp/root_app.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KC APP',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        useMaterial3: true,
        textTheme: GoogleFonts.deliusTextTheme(
          Theme.of(context).textTheme,
        ),
        scaffoldBackgroundColor: const Color.fromARGB(255, 246, 246, 253),
      ),
      debugShowCheckedModeBanner: false,
      home: const RootApp(),
    );
  }
}
