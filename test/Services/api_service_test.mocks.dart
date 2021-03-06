// Mocks generated by Mockito 5.0.17 from annotations
// in nyt_articles/test/Services/api_service_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:mockito/mockito.dart' as _i1;
import 'package:nyt_articles/Models/most_popular.dart' as _i2;
import 'package:nyt_articles/Services/api_service.dart' as _i3;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeMostPopular_0 extends _i1.Fake implements _i2.MostPopular {}

/// A class which mocks [NYTimesAPIService].
///
/// See the documentation for Mockito's code generation for more information.
class MockNYTimesAPIService extends _i1.Mock implements _i3.NYTimesAPIService {
  MockNYTimesAPIService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  String get url =>
      (super.noSuchMethod(Invocation.getter(#url), returnValue: '') as String);
  @override
  _i4.Future<_i2.MostPopular> getArticles() =>
      (super.noSuchMethod(Invocation.method(#getArticles, []),
              returnValue: Future<_i2.MostPopular>.value(_FakeMostPopular_0()))
          as _i4.Future<_i2.MostPopular>);
}
