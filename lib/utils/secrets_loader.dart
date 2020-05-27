import 'dart:async' show Future;
import 'dart:convert' show json;
import 'package:flutter/services.dart' show rootBundle;

class SecretLoader {
  final String secretPath;

  SecretLoader({this.secretPath});

  Future<List<Secret>> load() {
    return rootBundle.loadStructuredData<List<Secret>>(
      this.secretPath,
      (jsonStr) async => (json.decode(jsonStr) as Map)
          .entries
          .map((entry) => Secret.fromJson(entry))
          .toList(),
    );
  }
}

class Secret {
  final String key;
  final String value;

  Secret({this.key = "", this.value = ""});

  factory Secret.fromJson(MapEntry entry) => Secret(
        key: entry.key,
        value: entry.value,
      );
}
