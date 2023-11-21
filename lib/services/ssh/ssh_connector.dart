import 'package:dartssh2/dartssh2.dart';
import 'package:docker_file_injector/services/models/ssh_data.dart';
import 'package:launchable_interfaces/launchable_interfaces.dart';
import 'package:meta/meta.dart';

base class SshConnector implements Executable<SshData> {
  SshConnector({
    required final String ip,
    required final int port,
    required final String username,
    required final String password,
  })  : _password = password,
        _username = username,
        _port = port,
        _ip = ip;

  final String _ip;
  final int _port;
  final String _username;
  final String _password;

  @protected
  Future<SSHSocket> connect() => SSHSocket.connect(_ip, _port);

  @override
  Future<SshData> execute() async {
    final sshClient = SSHClient(
      await connect(),
      username: _username,
      onPasswordRequest: () => _password,
    );

    return SshData(sshClient: sshClient);
  }
}
