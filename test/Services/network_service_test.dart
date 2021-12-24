import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:nyt_articles/Services/network_service.dart';

import 'network_service_test.mocks.dart';

@GenerateMocks([NetworkService])
void main() {
  MockNetworkService mockNetworkService = MockNetworkService();
  var responseBody = "<!doctype html>";
  test('should return a response body of type String when get called',
      () async {
    //arange
    when(mockNetworkService.get("google.com"))
        .thenAnswer((_) async => responseBody);

    //act
    final tResponseBody = await mockNetworkService.get("google.com");

    //asert
    verify(mockNetworkService.get("google.com"));
    expect(tResponseBody, isInstanceOf<String>());
    reset(mockNetworkService);
  });
  test('should return a response body that is not empty', () async {
    //arange
    when(mockNetworkService.get("google.com"))
        .thenAnswer((_) async => responseBody);

    //act
    final tResponseBody = await mockNetworkService.get("google.com");

    //asert
    verify(mockNetworkService.get("google.com"));
    expect(tResponseBody, isNotEmpty);
    reset(mockNetworkService);
  });
  test('should return an exception of type FormatException when url is wrong',
      () async {
    //arange
    dynamic tResponseBody;
    when(mockNetworkService.get("google"))
        .thenThrow(const FormatException("Error"));

    //act
    try {
      tResponseBody = await mockNetworkService.get("google");
    } catch (e) {
      tResponseBody = e;
    }

    //asert
    verify(mockNetworkService.get("google"));
    expect(tResponseBody, isFormatException);
    reset(mockNetworkService);
  });
  test(
      'checkAndThrowError should return an exception string when response status code is != HttpStatus.ok',
      () async {
    //arange
    dynamic tResponseBody;
    dynamic exceptionMessage;
    const aUrlThatDoesntExist = "dasgdkuasvkjdbsldbljdbalfasdafbawbfjoqqwb.com";
    const responseBody = "not ok";
    when(mockNetworkService.get(aUrlThatDoesntExist))
        .thenThrow(Exception(responseBody));

    //act
    try {
      tResponseBody = await mockNetworkService.get(aUrlThatDoesntExist);
    } on Exception catch (e) {
      tResponseBody = e;
      exceptionMessage = e.toString();
    }

    //asert
    verify(mockNetworkService.get(aUrlThatDoesntExist));
    expect(tResponseBody, isException);
    expect(exceptionMessage, endsWith(responseBody));
    reset(mockNetworkService);
  });
}
