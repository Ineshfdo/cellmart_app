class ApiConfig {
  // Use 10.0.2.2 for Android emulator to access host machine's localhost
  static const String baseUrl = "http://10.0.2.2:8000/api";
  static const String hostUrl = "http://10.0.2.2:8000";
  static const String assetsUrl = "$hostUrl/Images";

  static const String getAllProducts = "$baseUrl/getAllProducts";
  static const String login = "$baseUrl/login";
  static const String register = "$baseUrl/register";
}
