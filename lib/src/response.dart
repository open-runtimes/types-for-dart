import 'dart:convert';

class RuntimeResponse {
  dynamic binary(
    List<int> bytes, [
    int statusCode = 200,
    Map<String, dynamic> headers = const {},
  ]) {
    return {'body': bytes, 'statusCode': statusCode, 'headers': headers};
  }

  dynamic send(
    String body, [
    int statusCode = 200,
    Map<String, dynamic> headers = const {},
  ]) {
    return this.text(body, statusCode, headers);
  }

  dynamic text(
    String body, [
    int statusCode = 200,
    Map<String, dynamic> headers = const {},
  ]) {
    return this.binary(utf8.encode(body), statusCode, headers);
  }

  dynamic json(
    Map<String, dynamic> json, [
    int statusCode = 200,
    Map<String, dynamic> headers = const {},
  ]) {
    var headersMerged = {...headers, 'content-type': 'application/json'};
    return this.text(jsonEncode(json), statusCode, headersMerged);
  }

  dynamic empty() {
    return this.text('', 204, const {});
  }

  dynamic redirect(
    String url, [
    int statusCode = 301,
    Map<String, dynamic> headers = const {},
  ]) {
    var headersMerged = {...headers, 'location': url};
    return this.text('', statusCode, headersMerged);
  }
}
