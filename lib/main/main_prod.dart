import '../app/config/env.dart';
import '../app/flavor/flavor_config.dart';
import 'main.dart';

void main() {

  FlavorConfig(
    env: Environment.prod,
    appName: "Demo",
  );
  startApp("prod");
}