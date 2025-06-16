import 'package:flutter_test/flutter_test.dart';

import 'package:url_builder/url_builder.dart';

void main() {
  test('adding parameters ', () {
    final urlBuilder = UrlBuilder('www.api.com');
    expect(urlBuilder.addParameter('param', '1').build(), 'www.api.com?param=1');
    expect(urlBuilder.addParameter('param2', '2').build(), 'www.api.com?param=1&param2=2');
    expect(urlBuilder.addParameter('param3', null, defaultValue: 'name').build(), 'www.api.com?param=1&param2=2&param3=name');
   
  });
}
