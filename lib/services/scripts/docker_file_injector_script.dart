import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:docker_file_injector/services/models/ssh_data.dart';
import 'package:launchable_interfaces/launchable_interfaces.dart';

class DockerFileInjectorScript implements Executable<void> {
  DockerFileInjectorScript({
    required final Executable<SshData> sshDataProvider,
    required final List<String> filesInjecting,
    required final String containerId,
    required final String pathCopyTmp,
    required final String pathCopyDocker,
    required final String passwordRoot,
  })  : _sshDataProvider = sshDataProvider,
        _filesInjecting = filesInjecting,
        _containerId = containerId,
        _pathCopyTmp = pathCopyTmp,
        _pathCopyDocker = pathCopyDocker,
        _rootPassword = passwordRoot;

  final Executable<SshData> _sshDataProvider;
  final List<String> _filesInjecting;
  final String _containerId;
  final String _pathCopyTmp;
  final String _pathCopyDocker;
  final String _rootPassword;

  Future<void> _awaitCmd() => Future.delayed(const Duration(seconds: 1));

  Uint8List _toBytes(final String cmd) => Uint8List.fromList(cmd.codeUnits);

  Future<void> _transferFile(
    final SshData sshData,
    final String fileName,
  ) async {
    final sessionTransferFile = await sshData.sshClient.execute(
      'cat > $_pathCopyTmp$fileName',
    );
    await sessionTransferFile.stdin.addStream(
      File(fileName).openRead().cast(),
    );
    await sessionTransferFile.stdin.close();
    await sessionTransferFile.done;
  }

  Future<void> _transferFiles(final SshData sshData) async {
    for (final fileName in _filesInjecting) {
      await _transferFile(sshData, fileName);
    }
  }


  @override
  Future<void> execute() async {
    final sshData = await _sshDataProvider.execute();

    await _transferFiles(sshData);

    final shell = await sshData.sshClient.shell();

    unawaited(stdout.addStream(shell.stdout));
    unawaited(stderr.addStream(shell.stderr));

    shell.write(_toBytes('sudo -i\n'));

    await _awaitCmd();

    shell.write(_toBytes('$_rootPassword\n'));

    await _awaitCmd();

    for (final fileName in _filesInjecting) {
      shell.write(
        _toBytes(
          'docker cp $_pathCopyTmp$fileName '
              '$_containerId:$_pathCopyDocker$fileName\n',
        ),
      );

      await _awaitCmd();
      shell.write(_toBytes('rm $_pathCopyTmp$fileName\n'));
      await _awaitCmd();
    }

    shell.close();
    sshData.sshClient.close();
  }
}
