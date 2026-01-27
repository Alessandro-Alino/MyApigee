import 'package:excel/excel.dart';
import 'package:myapigee/feature/parser_xml/model/api_model.dart';

class Export {
  // Export Postman Collection V2
  static Map<String, Object> postmanCollectionV2(
    String basepath,
    List<ApiModel> apiList,
  ) {
    return {
      "info": {
        "name": "Imported_API",
        "schema":
            "https://schema.getpostman.com/json/collection/v2.1.0/collection.json",
      },
      "item": [
        {
          "name": "api-001-${basepath.replaceAll("/", "")}",
          "item": apiList.map((e) {
            return {
              "name": e.api.replaceAll('*', '{id}'),
              "request": {
                "method": e.method.name.toUpperCase(),
                "header": [],
                "url": {
                  "raw": "{{hostname}}$basepath${e.api}",
                  "protocol": "https",
                  "host": ["{{hostname}}"],
                  "path": [
                    basepath,
                    ...e.api.split('/').where((e) => e.isNotEmpty),
                  ],
                },
              },
              "response": [],
            };
          }).toList(),
        },
      ],
    };
  }

  // Export Excel
  Excel exportExcel(String basepath, List<ApiModel> apiList) {
    // Create a new Excel document
    final excel = Excel.createExcel();

    // Get the default sheet
    final Sheet sheet = excel[excel.getDefaultSheet()!];

    // Define headers
    final List<CellValue> headers = [
      TextCellValue('APPLICATION'),
      TextCellValue('API'),
      TextCellValue('METHOD'),
      TextCellValue('SIT'),
      TextCellValue('UAT'),
      TextCellValue('PROD'),
    ];

    final CellStyle cellStyle = CellStyle(
      horizontalAlign: HorizontalAlign.Center,
      verticalAlign: VerticalAlign.Center,
      topBorder: Border(borderStyle: BorderStyle.Thin),
      rightBorder: Border(borderStyle: BorderStyle.Thin),
      bottomBorder: Border(borderStyle: BorderStyle.Thin),
      leftBorder: Border(borderStyle: BorderStyle.Thin),
    );

    // Write headers
    for (var i = 0; i < headers.length; i++) {
      sheet.cell(CellIndex.indexByColumnRow(columnIndex: i, rowIndex: 0))
        ..value = headers[i]
        ..cellStyle = cellStyle.copyWith(boldVal: true, fontSizeVal: 12);

      // Auto-fit columns
      sheet.setColumnAutoFit(i);
    }

    // Write Rows
    for (var i = 0; i < apiList.length; i++) {
      // Application
      sheet.cell(CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: i + 1))
        ..value = TextCellValue(basepath.replaceAll('/', ''))
        ..cellStyle = cellStyle;
      // Api
      sheet.cell(CellIndex.indexByColumnRow(columnIndex: 1, rowIndex: i + 1))
        ..value = TextCellValue(apiList[i].api)
        ..cellStyle = cellStyle;
      //Method
      sheet.cell(CellIndex.indexByColumnRow(columnIndex: 2, rowIndex: i + 1))
        ..value = TextCellValue(apiList[i].method.name.toUpperCase())
        ..cellStyle = cellStyle;
      // Sit
      sheet.cell(CellIndex.indexByColumnRow(columnIndex: 3, rowIndex: i + 1))
        ..value = TextCellValue("✔️")
        ..cellStyle = cellStyle;
      // Uat
      sheet.cell(CellIndex.indexByColumnRow(columnIndex: 4, rowIndex: i + 1))
        ..value = TextCellValue("✔️")
        ..cellStyle = cellStyle;
      // Prod
      sheet.cell(CellIndex.indexByColumnRow(columnIndex: 5, rowIndex: i + 1))
        ..value = TextCellValue("✔️")
        ..cellStyle = cellStyle;
    }
    // Merge cells in the first column
    sheet
      ..merge(
        CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: 1),
        CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: apiList.length),
      )
      ..setMergedCellStyle(
        CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: 1),
        cellStyle,
      );
    return excel;
  }
}
