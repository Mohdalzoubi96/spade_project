import 'package:flutter/material.dart';

class AppConstants {
  static var apiHeaders = {
    'Content-Type': 'application/json',
    "Accept": "application/json",
  };

  static var apiNewHeaders = {
    'Content-Type': 'application/json',
    "Accept": "application/json",
  };

  Map<String, dynamic> getHeader(String cookie){
    final data = {
      'Content-Type': 'application/json',
      "Accept": "application/json",
      "Cookie" : cookie,
    };
    return data;
  }

  static setApiToken(String token) {
    return apiHeaders.putIfAbsent("Authorization", () => "Bearer $token");
  }
}
