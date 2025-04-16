import 'package:global_configs/global_configs.dart';

class EnvConfig {
  static final EnvConfig _singleton = EnvConfig._internal();

  factory EnvConfig() {
    return _singleton;
  }

  EnvConfig._internal();

  Future<void> load({required String envStr}) async {
    await GlobalConfigs().loadJsonFromdir('assets/cfg/env_$envStr.json');
  }

  String get apiUrl => GlobalConfigs().get('api_url');
}
