class ApiEndPoint {
  static const String baseUrl = "http://192.168.1.7:3002/v1/api/";
  static const String login = "${baseUrl}auth/signin-mobile";
  static const String refresh = "${baseUrl}auth/refresh-mobile";
  static const String profile = "${baseUrl}user/me";
  static const String absenToday = "${baseUrl}user/absen-today";
  static const String absenMasuk = "${baseUrl}user/absen-masuk/";
  static const String historyAbsen = "${baseUrl}user/absen-history/";
}
