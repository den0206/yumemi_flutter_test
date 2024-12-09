import 'dart:core';

import 'package:faker/faker.dart';

abstract class BaseFactory<T> extends RandomFactory {
  /// 単体のフェイクモデルの生成
  T generateFake();

  /// 配列のフェイクモデルの作成
  List<T> generateFakeList({int? length});
}

class RandomFactory {
  Faker get faker => Faker();

  //ランダムの文字列生成
  String get rString {
    return faker.randomGenerator.string(10);
  }

  //ランダムのユーザー名生成
  String get rName {
    return faker.person.name();
  }

  //ランダムの文言生成
  String get rWord {
    return faker.lorem.word();
  }

  // ランダムのメールアドレス生成
  String get rEmail {
    return faker.internet.email();
  }

  // ランダムのURL生成
  String get rUrl {
    return faker.internet.httpsUrl();
  }

  // 乱数生成
  int get rInteger {
    const max = 100000;
    return faker.randomGenerator.integer(max, min: 1);
  }
}
