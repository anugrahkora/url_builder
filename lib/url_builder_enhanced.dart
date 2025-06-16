/// A utility class to construct and safely build URLs in a chainable way.
/// 
/// Supports dynamic path segments, query parameters, and URL fragments.
class UrlBuilder {
  /// The base [Uri] parsed from the provided URL string.
  final Uri _uri;

  /// Internal list of encoded path segments to be appended to the base URL.
  final List<String> _paths = [];

  /// Internal map of query parameters to be appended to the URL.
  final Map<String, String> _params = {};

  /// Optional URL fragment (e.g., #section1).
  String? _fragment;

  /// Creates a new [UrlBuilder] with the given [baseUrl].
  /// 
  /// Throws an assertion error if [baseUrl] is empty.
  UrlBuilder(String baseUrl)
      : assert(baseUrl.isNotEmpty, 'Base URL cannot be empty'),
        _uri = Uri.parse(baseUrl);

  /// Appends a single path segment to the URL.
  /// 
  /// The [path] is encoded using [Uri.encodeComponent]. Null values are not allowed.
  /// 
  /// Returns the current instance for chaining.
  UrlBuilder addPath(dynamic path) {
    assert(path != null, 'Path cannot be null');
    _paths.add(Uri.encodeComponent(path.toString()));
    return this;
  }

  /// Adds a query parameter to the URL.
  /// 
  /// The [param] name must not be empty. If [value] is null, nothing is added.
  /// Returns the current instance for chaining.
  UrlBuilder addParameter(String param, dynamic value,{String? defaultValue}) {
    
    assert(param.isNotEmpty, 'Parameter name cannot be empty');
    final resolvedValue=value?? defaultValue;
    if (resolvedValue != null) {
      _params[param] = resolvedValue.toString();
    }
    return this;
  }

  /// Appends a URL fragment (e.g., `#section1`) to the URL.
  /// 
  /// If [fragment] is null or empty, it is ignored.
  /// Returns the current instance for chaining.
  UrlBuilder addFragment(dynamic fragment) {
    if (fragment != null) {
      final fragStr = fragment.toString();
      assert(fragStr.isNotEmpty, 'Fragment cannot be an empty string');
      _fragment = Uri.encodeComponent(fragStr);
    }
    return this;
  }

  /// Builds the final URL as a string by combining base, path segments,
  /// query parameters, and fragment (if any).
  String build() {
    final builtUri = _uri.replace(
      pathSegments: [..._uri.pathSegments, ..._paths],
      queryParameters: _params.isNotEmpty ? _params : null,
      fragment: _fragment,
    );
    return builtUri.toString();
  }
}
