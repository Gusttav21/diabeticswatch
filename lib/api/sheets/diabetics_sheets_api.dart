import 'package:gsheets/gsheets.dart';
import '../../model/diabetics.dart';

// ignore: camel_case_types
class diabeticSheets {
  static const _credentials = r'''{
  
  "type": "service_account",
  "project_id": "tbldiabeticssheet",
  "private_key_id": "c49b6a85d372f3c6c6be8c90c65f634189201ae1",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDAm35VNweVZx94\noHpa+BZhtDZyk/MwfEZsXa+MuWgCe4pzjbcePT/uFV/scZX/ymW4adiynzdVIGuh\nMVLfliMM1KWPgobpZjnQ+W1rsWhhHMtTYSMdJD5AT+VzaqgmzwZroXGEkyXapcGB\nSJXRF0mDjhFB4jYP0JLRY8KPR5m1SSGF5Vp2hi1OAp4pIMq+ELFbMIVPVy6bDC7v\nmypof0TA9HkoQ00VdDbHYxgJZ3f2AQqrjS3ZZxl9HJIl9NHTmoJVK7RfdsPF+6G1\nxP+IhBKjUHOYYo64eUHk149+JiNmr2f4ng7xjxOLa0LKDj5T/yon1w+MYRFSH5Ao\nQytqqVCNAgMBAAECggEALw6ebDvsZKZkBEDy++BCeZ8BsXcvspAeVZIDFqbiwD6G\nOkqsq1zsDmNXAwnSS8MbnJVxrdxj9K6d1S1bkchY6mTWyUvq4cHJzOJvxyC6P4W9\nMHMaVN+avPQ4Oz1a9VZdu3SfazRXSob2UruU7NebbKKMWVQnALCk+jb9HSvxZB6b\naON3OzbJESREH6Scwp4kue7hCmlts+IOUT6SQHWSz/WJszDzVYxFDLDXTeM8McRf\nlFlyF2KoAxvx/AidwOqlXWbIocK1wHkKcH599l3lfyhHzWvPg84PloixSyZ2M7mj\nDjiwBEpSSkjQz+ng2EtEHja1XRFxbTblHZntnety0QKBgQD55HVsGJXq9bZU5gq5\ndr9SNYa/SiWOBmZuvDGiq0b+aGF1HRtMEERoOxnUNKgRPfqRoiYeJuvvdbU3b32o\nLTkd8CLM93lixpnPYAyPcK0w/BWyTlPuF8XDSJuZG+7Ahe6kZNp7eGA2FelFsbSq\nU2awE66meerlgM18BkBMsCGV/QKBgQDFUJxPAU5n0IdDO2BHTqZnWhQ5SHHpBLqg\n1MBj+AsdmGv6WNc/M97stueWufyXS45MrHp526GEhKoXgqyE16lvTEM5fT2dkv0x\nY3OTvsVjc/uS9s3xqIvSSIf9RvC3bMPF9S0x12eKy0VmTFYxRqyjtFnaVyuU/3Yq\nt2F9Mt1h0QKBgH6o/6N0qrhXJr3Ng+4RdFP08YGP0Y01TUIffYEYE3nr6kn0INvi\n+ulh22ul7PIgWhrq9ysdS0UqglnA1w4hLewwxVLitNIOG/PymSszT3WesFiaPwxV\nXFXpPYTTlaZbvGPzApLGpu2DGaPLuOkEMO5aa5HSBe+h44VTnc/BDqT5AoGAOKEH\nC2Grl/3wJCqRWkXHWlgu/7W8A4145pnI0agpwIezTblbpWcErtlbpBWi2eU0ZOsH\nh5uyQm80xeSaENI4bZnsnT5Fhcje4+LQE/IngoCSDj7JIncmEecBKH7IrUwI7/KK\n0wgoTlxCgbac8i1/dMhZFWH5Px0GVAInd6A2i1ECgYEA6Pn5pZ7gVkQVlHzRyx1r\n3QvfQEcSGBv0eFjlnbz5GC0EEL4L9EPtR6xjaOmdYVernKmFGOIL3XE5YE0ohkFC\noggPScQ/urYvhHD5Mf52bEcLqiqO12lXYeoYMg+O87F5ImVBvTcLXS5nv0PyTzEH\ntyov9na9xo4hqJ9vYOsI/3s=\n-----END PRIVATE KEY-----\n",
  "client_email": "gsheets@tbldiabeticssheet.iam.gserviceaccount.com",
  "client_id": "109035959475898324167",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/gsheets%40tbldiabeticssheet.iam.gserviceaccount.com"

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
