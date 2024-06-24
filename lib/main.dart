
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'package:swift_note/main.dart';
import 'pages/notes_page.dart';
import 'package:swift_note/models/note_database.dart';
import 'theme/theme_provider.dart';

void main() async {
  // initialize note isar database
  WidgetsFlutterBinding.ensureInitialized();
  await NoteDatabase.initialize();

  runApp(
    MultiProvider(
      providers: [
        // note provider
        ChangeNotifierProvider(create: (context) => NoteDatabase()),
        // theme provider
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const NotesPage(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}