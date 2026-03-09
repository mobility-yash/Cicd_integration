import '../config/env.dart';

class FlavorConfig {
  final Environment env;
  // final String baseUrl;
  final String appName;

  static late FlavorConfig instance;

  FlavorConfig._({
    required this.env,
    // required this.baseUrl,
    required this.appName,
  });

  factory FlavorConfig({
    required Environment env,
    // required String baseUrl,
    required String appName,
  }) {
    instance = FlavorConfig._(
      env: env,
      // baseUrl: baseUrl,
      appName: appName,
    );

    return instance;
  }
}