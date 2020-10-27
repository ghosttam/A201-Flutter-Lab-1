import 'package:flutter/material.dart';
import 'package:lab_assignment1/code/code.dart';

void main() => runApp(MyApp());

// ignore: camel_case_types
class result extends StatefulWidget {
  @override
  _resultState createState() => _resultState();
}

// ignore: camel_case_types
class _resultState extends State<result> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        centerTitle: true,
        title: Text('Lean Body Mass (Metric Unit)'),
      ),
      backgroundColor: Colors.white,
      body: Row(children: [
        Container(
          child: DataTable(showBottomBorder: true, columns: [
            DataColumn(label: Text('Formulae')),
            DataColumn(label: Text('Lean Body Mass')),
            DataColumn(label: Text('Body Fat')),
          ], rows: [
            DataRow(cells: [
              DataCell(Text('Boer')),
              DataCell(Text(boer_test + 'kg' + ' (' + boer_percent + '%)')),
              DataCell(Text(boer_fat + '%'))
            ]),
            DataRow(cells: [
              DataCell(Text('James')),
              DataCell(Text(james_test + 'kg' + ' (' + james_percent + '%)')),
              DataCell(Text(james_fat + '%'))
            ]),
            DataRow(cells: [
              DataCell(Text('Hume')),
              DataCell(Text(hume_test + 'kg' + ' (' + hume_percent + '%)')),
              DataCell(Text(hume_fat + '%'))
            ]),
          ]),
        ),
      ]),
    );
  }
}
