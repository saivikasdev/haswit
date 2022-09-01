import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:haswit_mentor_app/main_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyDpy4BcLpp1DG2P2roLvGYpSrVge_Sn64k",
          authDomain: "haswit-org.firebaseapp.com",
          projectId: "haswit-org",
          storageBucket: "haswit-org.appspot.com",
          messagingSenderId: "169038556555",
          appId: "1:169038556555:web:1e3d0924b360fe14d8538e",
          measurementId: "G-44HZ77J8DQ"),
    ).then(
      (value) => runApp(MyApp()),
    );
  } on Exception catch (e) {
    e.toString();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const Main_screen(),
    );
  }
}
