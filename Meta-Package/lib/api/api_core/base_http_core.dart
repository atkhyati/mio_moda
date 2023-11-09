import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

extension ParsingExtension on Response {
  List<T> many<T>(T Function(Map<String, dynamic> json) fromJson) =>
      data is Iterable
          ? (data as Iterable<dynamic>)
              .map((dynamic e) => fromJson(e as Map<String, dynamic>))
              .toList()
          : <T>[fromJson(data as Map<String, dynamic>)];

  /// Format the [data] to one [T]
  T one<T>(T Function(Map<String, dynamic> json) fromJson) =>
      fromJson(data as Map<String, dynamic>);
}

extension ParsingHttpExtension on http.Response {
  List<T> many<T>(T Function(Map<String, dynamic> json) fromJson) =>
      body is Iterable
          ? (body as Iterable<dynamic>)
              .map((dynamic e) => fromJson(e as Map<String, dynamic>))
              .toList()
          : <T>[fromJson(body as Map<String, dynamic>)];

  /// Format the [data] to one [T]
  T one<T>(T Function(Map<String, dynamic> json) fromJson) =>
      fromJson(body as Map<String, dynamic>);
}
