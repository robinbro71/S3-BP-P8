class AppConfig {
  // change this one place when switching between dev host IPs
  static const String baseHost = 'http://172.26.255.140'; // <-- your PC LAN IP
  static const String basePath = '/goodhealth'; // app root path

  /// full base URL like "http://192.168.1.100/goodhealth"
  static String get baseUrl {
    // normalize slashess
    final host = baseHost.endsWith('/')
        ? baseHost.substring(0, baseHost.length - 1)
        : baseHost;
    final path = basePath.startsWith('/') ? basePath : '/$basePath';
    return '$host$path';
  }
}