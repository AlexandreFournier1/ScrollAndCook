import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scroll_and_cook/routes/router.dart';
import 'package:scroll_and_cook/styles/colors.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scroll & Cook',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: kMainBackgroundColor),
      ),
      routes: router,
      initialRoute: '/',
    );
  }
}
