import 'package:diabeticswatch/page/create_sheets_page.dart';
import 'package:flutter/material.dart';
import 'api/sheets/diabetics_sheets_api.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await diabeticSheets.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const String title = 'Diabetics Sheet';
  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const CreateSheetsPage(),
      );
}
