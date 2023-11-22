import 'package:docker_file_injector/di/static_dependencies.dart';
import 'package:docker_file_injector/services/models/ssh_data.dart';
import 'package:docker_file_injector/services/ssh/ssh_connector.dart';
import 'package:launchable_interfaces/launchable_interfaces.dart';

Future<Executable<SshData>> configSshDataProvider() async => SshConnector(
      ip: ip,
      port: portSsh,
      username: usernameSsh,
      password: passwordSsh,
    );
