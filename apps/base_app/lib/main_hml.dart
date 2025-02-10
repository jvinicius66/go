import 'app_main.dart' as runner;
import 'flavor.dart';

Future<void> main() async {
  Flavor.appFlavor = FlavorEnum.hml;
  await runner.main();
}
