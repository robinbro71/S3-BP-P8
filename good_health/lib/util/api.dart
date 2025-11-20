import 'config.dart';

class Api {
  /// Build a Uri for a relative path under the basePath.
  /// Example: Api.endpoint('/pasien/create.php')
  static Uri endpoint(String relativePath) {
    if (!relativePath.startsWith('/')) relativePath = '/$relativePath';
    final full = '${AppConfig.baseUrl}$relativePath';
    return Uri.parse(full);
  }

  /// Common headers (modify if you need auth tokens, etc.)
  static Map<String, String> defaultHeaders() => {
    'Content-Type': 'application/json',
  };
}