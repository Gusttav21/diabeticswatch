import 'package:gsheets/gsheets.dart';
import '../../model/diabetics.dart';

// ignore: camel_case_types
class diabeticSheets {
  static const _credentials = r'''{
  
// credential
  }''';
  static final _spreadsheetId = '1F4YETUa0JtogtZptPDssD6Ki666EFNnifkI9iBLVoY4';
  static final _gsheets = GSheets(_credentials);
  static Worksheet? _diabeticSheet;

  static Future init() async {
    try {
      final spreadsheet = await _gsheets.spreadsheet(_spreadsheetId);
      _diabeticSheet = await _getWorksheet(spreadsheet, title: 'sheet1');

      final firstRow = DiabeticFields.getFields();
      _diabeticSheet!.values.insertRow(1, firstRow);
    } catch (e) {
      // ignore: avoid_print
      print('init error: $e');
    }
  }

  static Future<Worksheet> _getWorksheet(
    Spreadsheet spreadsheet, {
    required String title,
  }) async {
    try {
      return await spreadsheet.addWorksheet(title);
    } catch (e) {
      return spreadsheet.worksheetByTitle(title)!;
    }
  }

  static Future<int> getRowCount() async {
    if (_diabeticSheet == null) return 0;
    final lastRow = await _diabeticSheet!.values.lastRow();
    return lastRow == null ? 0 : int.tryParse(lastRow.first) ?? 0;
  }

  static Future insert(List<Map<String, dynamic>> rowList) async {
    if (_diabeticSheet == null) return;

    _diabeticSheet!.values.map.appendRows(rowList);
  }
}
