import 'package:flutter/material.dart';
import 'package:lab_assignment1/code/code.dart';

void main() => runApp(MyApp());

// ignore: camel_case_types
class result2 extends StatefulWidget {
  @override
  _result2State createState() => _result2State();
}

// ignore: camel_case_types
class _result2State extends State<result2> {
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
          child:
              DataTable(columnSpacing: 20.0, showBottomBorder: true, columns: [
            DataColumn(label: Text('Formulae')),
            DataColumn(label: Text('Lean Body Mass')),
            DataColumn(label: Text('Body Fat')),
          ], rows: [
            DataRow(cells: [
              DataCell(Text('Peters(for Children)')),
              DataCell(Text(child_test + 'kg' + ' (' + child_percent + '%)')),
              DataCell(Text(child_fat + '%'))
            ]),
          ]),
        ),
      ]),
    );
  }
}
