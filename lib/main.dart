import 'package:buttomnavigationbar/counter.dart';
import 'package:buttomnavigationbar/provider/counter_provider.dart';
import 'package:buttomnavigationbar/provider/slider_provider.dart';
import 'package:buttomnavigationbar/provider/stepper_provider.dart';
import 'package:buttomnavigationbar/slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => StepperProvider()),
        ChangeNotifierProvider(create: (_) => CounterProvider()),
        ChangeNotifierProvider(create: (_) => SliderProvider())
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: CounterPage(),
      ),
    );
  }
}
