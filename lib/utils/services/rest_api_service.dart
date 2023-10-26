import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:retry/retry.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils.export.dart';

class RestApiService {
  /// Fires a Get request to an endpoint('path')
  /// Note that query params MUST BE STRINGS or lists of strings.
  static Future<http.Response> get(String path, {Map<String, dynamic> queryParams = const {}, bool isNewHeader = false}) async {
    final url = Uri.https(ApiPaths.base, path, queryParams);
    if(kDebugMode){
      print('url -> $url');
      print('queryParams -> $queryParams');
    }
    final _header;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _header = isNewHeader ? AppConstants().getHeader(prefs.getString('global_cookies') ?? '') : AppConstants.apiHeaders;
    return retry(() => http.get(url, headers: _header).timeout(const Duration(seconds: 4)),
        retryIf: (e) => e is SocketException || e is TimeoutException, maxAttempts: 4);
  }

  static Future<http.Response> post(String path,
      [Object? requestBody, Map<String, dynamic> queryParams = const {}]) async {
    final url = Uri.https(ApiPaths.base, path, queryParams);
    if(kDebugMode){
      print('url -> $url');
      print('queryParams -> $queryParams');
    }
    return retry(
        () => http.post(url, headers: AppConstants.apiHeaders, body: requestBody).timeout(const Duration(seconds: 4)),
        retryIf: (e) => e is SocketException || e is TimeoutException,
        maxAttempts: 4);
  }

  static Future<http.Response> put(String path,
      [Object? requestBody, Map<String, dynamic> queryParams = const {}]) async {
    final url = Uri.https(ApiPaths.base, path, queryParams);
    print(url);
    print(requestBody);
    return retry(() => http.put(url, headers: AppConstants.apiHeaders, body: requestBody).timeout(const Duration(seconds: 4)),
        retryIf: (e) => e is SocketException || e is TimeoutException, maxAttempts: 4);
  }
}
