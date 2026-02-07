import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../config/api_config.dart';

class AuthService {
  static String? token;
  // ValueNotifier allows the UI to listen for changes and rebuild automatically
  static final ValueNotifier<bool> isLoggedInNotifier = ValueNotifier<bool>(
    false,
  );
  static bool get isLoggedIn => token != null;

  // Login user with email and password
  static Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await http.post(
        Uri.parse(ApiConfig.login),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode({'email': email, 'password': password}),
      );

      final responseData = jsonDecode(response.body);

      if (response.statusCode == 200) {
        // Store token and mark as logged in.
        token = responseData['token'] ?? 'logged_in';
        // Updating the notifier triggers any listening UI components to rebuild.
        isLoggedInNotifier.value = true;

        return {
          'success': true,
          'message': responseData['message'] ?? 'Login successful',
          'data': responseData,
        };
      } else {
        return {
          'success': false,
          'message': responseData['message'] ?? 'Login failed',
          'errors': responseData['errors'] ?? {},
        };
      }
    } catch (e) {
      return {'success': false, 'message': 'Network error: ${e.toString()}'};
    }
  }

  // Register new user with name, email, password, and confirmation
  static Future<Map<String, dynamic>> register({
    required String name,
    required String email,
    required String password,
    required String passwordConfirmation,
  }) async {
    try {
      final response = await http.post(
        Uri.parse(ApiConfig.register),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        // Convert the Dart map into JSON
        body: jsonEncode({
          'name': name,
          'email': email,
          'password': password,
          'password_confirmation': passwordConfirmation,
        }),
      );

      final responseData = jsonDecode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        // Auto login after register and API returns token
        if (responseData['token'] != null) {
          token = responseData['token'];
          isLoggedInNotifier.value = true;
        }
        return {
          'success': true,
          'message': responseData['message'] ?? 'Registration successful',
          'data': responseData,
        };
      } else {
        return {
          'success': false,
          'message': responseData['message'] ?? 'Registration failed',
          'errors': responseData['errors'] ?? {},
        };
      }
    } catch (e) {
      return {'success': false, 'message': 'Network error: ${e.toString()}'};
    }
  }

  static void logout() {
    token = null;
    isLoggedInNotifier.value = false;
  }
}
