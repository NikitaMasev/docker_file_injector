import 'package:docker_file_injector/di/ssh_config.dart';
import 'package:docker_file_injector/di/static_dependencies.dart';
import 'package:docker_file_injector/services/scripts/docker_file_injector_script.dart';
import 'package:launchable_interfaces/launchable_interfaces.dart';

Future<Executable<void>> configDockerFileInjector() async {
  final sshDataProvider = await configSshDataProvider();
  final filesInjection = <String>[];

  if (isOneFileInjecting) {
    filesInjection.add(getOneFileInjecting);
  } else {
    filesInjection.addAll(getFilesInjecting);
  }

  return DockerFileInjectorScript(
    sshDataProvider: sshDataProvider,
    filesInjecting: filesInjection,
    containerId: containerId,
    pathCopyTmp: pathTmpCopyFile,
    pathCopyDocker: pathDockerCopyFile,
    passwordRoot: passwordRoot,
  );
}
