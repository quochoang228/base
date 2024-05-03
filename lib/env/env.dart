import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
final class Env {
  // @EnviedField(varName: 'KEY1')
  // static const String key1 = _Env.key1;
  // @EnviedField(varName: 'KEY2')
  // static const String key2 = _Env.key2;
  // @EnviedField()
  // static const String key3 = _Env.key3;
  // @EnviedField()
  // static const int key4 = _Env.key4;
  // @EnviedField()
  // static const bool key5 = _Env.key5;

  // @EnviedField()
  // static final Uri baseUrl = _Env.BASEURL;

  @EnviedField(varName: 'BASEURL')
  static const String baseUrl = _Env.baseUrl;

  @EnviedField(varName: 'NEWAPIKKEY')
  static const String newsApikey = _Env.newsApikey;

  // @EnviedField()
  // static final DateTime key7 = _Env.key7;
  //
  // @EnviedField()
  // static final ExampleEnum key8 = _Env.key8;
  //
  // @EnviedField(rawString: true)
  // static const String key9 = _Env.key9;
}

enum ExampleEnum { lorem, ipsum, dolor }