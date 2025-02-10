import 'app_main.dart' as runner;
import 'flavor.dart';

Future<void> main() async {
  Flavor.appFlavor = FlavorEnum.prod;
  await runner.main();
}
