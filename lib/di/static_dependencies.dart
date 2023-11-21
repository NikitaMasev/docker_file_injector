import 'dart:io';

import 'package:docker_file_injector/di/env.dart';

final ip = Platform.environment['IP'] ?? Env.ip;
final port = int.parse(Platform.environment['PORT'] ?? Env.port);
final usernameSsh = Platform.environment['USERNAME_SSH'] ?? Env.usernameSsh;
final passwordSsh = Platform.environment['PASSWORD_SSH'] ?? Env.passwordSsh;
final containerId = Platform.environment['CONTAINER_ID'] ?? Env.containerId;
final fileName = Platform.environment['FILE_NAME'] ?? Env.fileName;
final pathCopyFile = Platform.environment['PATH_FILE'] ?? Env.pathFile;
