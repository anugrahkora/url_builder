A lightweight, chainable utility for building and manipulating URLs in Dart or Flutter projects.

Construct clean, dynamic URLs with path segments, query parameters, and fragments—all in a fluent API.

## Features

✅ Type-safe and null-aware
✅ Chainable method calls
✅ Automatically encodes components
✅ Fragment support (`#section`)
✅ Easy to test and integrate


## Getting started

Add the dependency in your `pubspec.yaml`:
```yaml
dependencies:
  url_builder: ^1.0.0
```  
Then run
```
flutter pub get  
```


## Usage

```
import 'package:url_builder/url_builder.dart';

void main() {
  final url = UrlBuilder('https://api.example.com')
      .addPath('users')
      .addPath(123)
      .addParameter('active', true)
      .addParameter('sort', 'name')
      .addFragment('profile')
      .build();

  print(url);
  // Output: https://api.example.com/users/123?active=true&sort=name#profile
}
```

## Constructor 

```
UrlBuilder(String baseUrl)
```

## Methods

| Method                | Description                                      |
| --------------------- | ------------------------------------------------ |
| `.addPath(dynamic)`   | Adds a URL-encoded path segment.                 |
| `.addParameter(k, v)` | Adds a query parameter if the value is not null. |
| `.addFragment(frag)`  | Adds a URL fragment (after `#`).                 |
| `.build()`            | Returns the final URL string.                    |



