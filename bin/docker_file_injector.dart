import 'package:docker_file_injector/di/scripts_config.dart';

Future<void> main() async {
  final dockerFileInjector = await configDockerFileInjector();
  await dockerFileInjector.execute();
}
