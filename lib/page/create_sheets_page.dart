import 'package:diabeticswatch/api/sheets/diabetics_sheets_api.dart';
import 'package:diabeticswatch/main.dart';
import 'package:diabeticswatch/widget/diabetic_form_widget.dart';
import 'package:flutter/material.dart';

class CreateSheetsPage extends StatelessWidget {
  const CreateSheetsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text(MyApp.title),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: DiabeticFormWidget(
              onSavedDiabetic: (diabetic) async {
                final id = await diabeticSheets.getRowCount() + 1;
                final newDiabetic = diabetic.copy(id: id);
                await diabeticSheets.insert([newDiabetic.toJson()]);
              },
            ),
          ),
        ),
      );
}
  /*

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text(MyApp.title),
          centerTitle: true,
        ),
        body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(32),
          child: Center(
            child: DiabeticFormWidget(
              onSavedDiabetic: (diabetic) async {
                final id = await diabeticSheets.getRowCount() + 1;
                final newDiabetic = diabetic.copy(id: id);
                await diabeticSheets.insert([newDiabetic.toJson()]);
              },
            ),
          ),
        ),
      );

//  Future insertDiabetic() async {

  //   final jsonDiabetic = diabetics.map((diabetic) => diabetic.toJson()).toList();
  //  await diabeticSheets.insert(jsonDiabetic);
  // }
}*/
