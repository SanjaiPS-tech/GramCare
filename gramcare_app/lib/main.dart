import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Set preferred orientations
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // Set status bar transparent
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );

  // Initialize Hive
  await Hive.initFlutter();
  
  // Initialize Firebase (Optional/Placeholder for now)
  // try {
  //   await Firebase.initializeApp();
  // } catch (e) {
  //   print("Firebase not initialized: $e");
  // }

  runApp(
    const ProviderScope(
      child: GramCareApp(),
    ),
  );
}
