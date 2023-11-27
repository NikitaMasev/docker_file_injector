import 'dart:io';

import 'package:docker_file_injector/di/env.dart';

final ip = Platform.environment['IP'] ?? Env.ip;
final portSsh = int.parse(Platform.environment['PORT'] ?? Env.portSsh);
final usernameSsh = Platform.environment['USERNAME_SSH'] ?? Env.usernameSsh;
final passwordSsh = Platform.environment['PASSWORD_SSH'] ?? Env.passwordSsh;
final passwordRoot = Platform.environment['PASSWORD_ROOT'] ?? Env.passwordRoot;
final containerId = Platform.environment['CONTAINER_ID'] ?? Env.containerId;
final _filesInjecting =
    Platform.environment['FILES_INJECTING'] ?? Env.filesInjecting;
final pathTmpCopyFile =
    Platform.environment['PATH_FILE_TMP'] ?? Env.pathFileTmp;
final pathDockerCopyFile =
    Platform.environment['PATH_FILE_DOCKER'] ?? Env.pathFileDocker;

bool get isOneFileInjecting => !_filesInjecting.contains('/');

String get getOneFileInjecting =>
    isOneFileInjecting ? _filesInjecting : getFilesInjecting.first;

List<String> get getFilesInjecting => _filesInjecting.split('/');
