import 'dart:convert';

import 'package:flutter/cupertino.dart';

class Pokemon {
  final String id;
  final List<dynamic> types;
  final String imageUrl;
  final String imageUrlHiRes;
  final String name;

  Pokemon(
      {@required this.id,
      @required this.types,
      @required this.imageUrl,
      @required this.imageUrlHiRes,
      @required this.name});

  String toJson() {
    Map<String, dynamic> json = _fromMapJson();
    return jsonEncode(json);
  }

  Map<String, dynamic> _fromMapJson() {
    return {
      'id': id,
      'types': types,
      'imageUrl': imageUrl,
      'imageUrlHiRes': imageUrlHiRes,
      'name': name,
    };
  }
}
