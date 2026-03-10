
import '../app/config/env.dart';
import '../app/flavor/flavor_config.dart';
import '../main.dart';

void main() async {
  FlavorConfig(
    env: Environment.dev,
    appName: "Demo",
  );

  startApp("dev");
}

