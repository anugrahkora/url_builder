import 'package:flutter/foundation.dart';
import 'package:url_builder_enhanced/url_builder_enhanced.dart';

void main() {
  final url = UrlBuilder('https://api.example.com')
      .addPath('users')
      .addPath(123)
      .addParameter('active', true)
      .addParameter('sort', 'name')
      .addFragment('profile')
      .build();

  if (kDebugMode) {
  debugPrint(url);
}
  // Output: https://api.example.com/users/123?active=true&sort=name#profile
}