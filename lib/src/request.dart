import 'dart:convert';

class RuntimeRequest {
  List<int> bodyBinary;
  Map<String, dynamic> headers;
  String method;
  String url;
  String path;
  int port;
  String scheme;
  String host;
  String queryString;
  Map<String, String> query;

  dynamic get body {
    String contentType = (this.headers['content-type'] ?? 'text/plain')
        .toLowerCase();

    if (contentType.startsWith("application/json")) {
      if (this.bodyBinary.isEmpty) {
        return new Map<String, dynamic>();
      } else {
        return this.bodyJson;
      }
    }

    return this.bodyText;
  }

  String get bodyRaw {
    return this.bodyText;
  }

  String get bodyText {
    return utf8.decode(this.bodyBinary);
  }

  dynamic get bodyJson {
    return jsonDecode(this.bodyText);
  }

  RuntimeRequest({
    String method = '',
    String scheme = '',
    String host = '',
    int port = 80,
    String path = '',
    Map<String, String> query = const {},
    String queryString = '',
    Map<String, dynamic> headers = const {},
    List<int> bodyBinary = const [],
    String url = '',
  }) : method = method,
       scheme = scheme,
       host = host,
       port = port,
       path = path,
       query = query,
       queryString = queryString,
       headers = headers,
       bodyBinary = bodyBinary,
       url = url {}
}
