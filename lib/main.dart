import 'package:diabeticswatch/page/create_sheets_page.dart';
import 'package:flutter/material.dart';
import 'api/sheets/diabetics_sheets_api.dart';
import 'package:flutter/services.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await diabeticSheets.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'Diabetics Sheet';
  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(primarySwatch: Colors.blue),
        home: CreateSheetsPage(),
      );
}
