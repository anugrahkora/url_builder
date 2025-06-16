import 'package:flutter_test/flutter_test.dart';
import 'package:url_builder_enhanced/url_builder_enhanced.dart';

void main() {
  group('UrlBuilder', () {
    test('builds base URL correctly', () {
      final url = UrlBuilder('https://example.com').build();
      expect(url, equals('https://example.com'));
    });

    test('adds a single path segment', () {
      final url = UrlBuilder('https://example.com')
          .addPath('users')
          .build();
      expect(url, equals('https://example.com/users'));
    });

    test('adds multiple path segments', () {
      final url = UrlBuilder('https://example.com')
          .addPath('users')
          .addPath('123')
          .build();
      expect(url, equals('https://example.com/users/123'));
    });

    test('adds query parameters', () {
      final url = UrlBuilder('https://example.com')
          .addParameter('sort', 'asc')
          .addParameter('active', true)
          .build();
      expect(url, equals('https://example.com?sort=asc&active=true'));
    });

    test('ignores null parameter values', () {
      final url = UrlBuilder('https://example.com')
          .addParameter('sort', null)
          .build();
      expect(url, equals('https://example.com'));
    });

    test('adds URL fragment', () {
      final url = UrlBuilder('https://example.com')
          .addFragment('section1')
          .build();
      expect(url, equals('https://example.com#section1'));
    });

    test('combines path, parameters, and fragment', () {
      final url = UrlBuilder('https://example.com')
          .addPath('products')
          .addParameter('q', 'laptop')
          .addFragment('details')
          .build();
      expect(url, equals('https://example.com/products?q=laptop#details'));
    });

    test('encodes special characters in path, params, and fragment', () {
      final url = UrlBuilder('https://example.com')
          .addPath('category & deals')
          .addParameter('name', 'John Doe & Co.')
          .addFragment('tab 1')
          .build();
      expect(url, equals(
          'https://example.com/category%2520%2526%2520deals?name=John+Doe+%26+Co.#tab%201'));
    });

    test('throws assertion error for empty base URL', () {
      expect(() => UrlBuilder(''), throwsA(isA<AssertionError>()));
    });

    test('throws assertion error for null path', () {
      expect(() => UrlBuilder('https://example.com').addPath(null),
          throwsA(isA<AssertionError>()));
    });

    test('throws assertion error for empty param name', () {
      expect(() => UrlBuilder('https://example.com').addParameter('', 'value'),
          throwsA(isA<AssertionError>()));
    });

    test('Throw assertion for empty fragment', () {

      expect(()=>UrlBuilder('https://example.com')
          .addFragment('')
          .build(),  throwsA(isA<AssertionError>()));
    });
  });
}
