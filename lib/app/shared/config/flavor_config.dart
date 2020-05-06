import 'package:flutter/material.dart';

class FlavorConfig {
  final Flavor flavor;
  final String name;
  final Color color;
  final FlavorValues values;
  static FlavorConfig _instance;

  factory FlavorConfig({
    @required Flavor flavor,
    Color color = Colors.blue,
    @required FlavorValues values,
  }) {
    _instance ??=
        FlavorConfig._internal(flavor, flavor.toStringEnum(), color, values);
    return _instance;
  }

  FlavorConfig._internal(this.flavor, this.name, this.color, this.values);
  static FlavorConfig get instance => _instance;

  static bool get isProduction => _instance.flavor == Flavor.production;
  static bool get isDevelopment => _instance.flavor == Flavor.dev;
  static bool get isQA => _instance.flavor == Flavor.qa;
}

enum Flavor { dev, qa, production }

extension FlavorExtension on Flavor {
  String toStringEnum() {
    return toString().replaceFirst("Flavor.", "");
  }
}

class FlavorValues {
  FlavorValues({@required this.baseUrl});
  final String baseUrl;
  //Add other flavor specific values, e.g database name
}
