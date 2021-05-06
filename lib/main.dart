import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:testapp/shared/Blocobserve.dart';


import 'layouts/homelayout.dart';
import 'modules/bmi/Bmi.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home:MyHomeLayout(),
    );
  }
}
