import 'dart:async';
import 'package:flutter/material.dart';
import 'routes/route_generator.dart';

import 'constants/routes.dart';
import 'services/di/get_it.dart' as get_it;

void main() {
  unawaited(get_it.init());
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final RouteGenerator _routeGenerator = get_it.getItInstance<RouteGenerator>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: Routes.initial,
      onGenerateRoute: _routeGenerator.generateRoute,
    );
  }
}
