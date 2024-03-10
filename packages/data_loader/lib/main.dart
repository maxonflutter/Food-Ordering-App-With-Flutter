import 'package:core/entities.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:db_client/common.dart';
import 'package:db_client/flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "...",
      authDomain: "...",
      projectId: "...",
      storageBucket: "...",
      messagingSenderId: "...",
      appId: "...",
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final firestore = FirestoreDbClient();
  final sampleData = FakeDbClient().dataStore;

  @override
  void initState() {
    loadSampleUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  void loadSampleUsers() {
    final users = sampleData['users'];

    if (users != null) {
      for (final user in users) {
        firestore.add(entity: 'users', data: User.fromJson(user).toJson());
      }
    }
  }
}
