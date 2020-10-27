import 'package:flutter/material.dart';
import 'package:lab_assignment1/code/code.dart';
import 'package:lab_assignment1/code/result.dart';
import 'package:lab_assignment1/code/result2.dart';

void main() => runApp(MaterialApp(
      routes: {
        '/': (context) => MyApp(),
        '/result': (context) => result(),
        '/result2': (context) => result2(),
      },
    ));
