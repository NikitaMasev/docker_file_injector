import 'package:docker_file_injector/services/models/ssh_data.dart';
import 'package:launchable_interfaces/launchable_interfaces.dart';

class DockerFileInjectorScript implements Executable<void> {
  DockerFileInjectorScript({
    required final Executable<SshData> sshDataProvider,
    required final String fileName,
    required final String containerId,
    required final String pathCopy,
  })  : _sshDataProvider = sshDataProvider,
        _fileName = fileName,
        _containerId = containerId,
        _pathCopy = pathCopy;

  final Executable<SshData> _sshDataProvider;
  final String _fileName;
  final String _containerId;
  final String _pathCopy;

  @override
  Future<void> execute() async {
    final sshData = await _sshDataProvider.execute();
    await sshData.sshClient.run('sudo -i');
    await sshData.sshClient.run(
      'docker cp $_fileName $_containerId:$_pathCopy$_fileName',
    );
  }
}
