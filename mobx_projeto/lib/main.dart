import 'package:flutter/material.dart';
import 'package:mobx_projeto/controller.dart';
import 'package:mobx_projeto/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    // create: (_) => Controller()
    providers: [
      Provider<Controller>(
        create: (_) => Controller(),
      )
    ]
    , child: MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
  ),));
}
