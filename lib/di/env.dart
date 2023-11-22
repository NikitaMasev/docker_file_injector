import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied()
abstract class Env {
  @EnviedField(varName: 'IP')
  static const String ip = _Env.ip;
  @EnviedField(varName: 'PORT_SSH')
  static const String portSsh = _Env.portSsh;
  @EnviedField(varName: 'USERNAME_SSH')
  static const String usernameSsh = _Env.usernameSsh;
  @EnviedField(varName: 'PASSWORD_SSH')
  static const String passwordSsh = _Env.passwordSsh;
  @EnviedField(varName: 'PASSWORD_ROOT')
  static const String passwordRoot = _Env.passwordRoot;
  @EnviedField(varName: 'CONTAINER_ID')
  static const String containerId = _Env.containerId;
  @EnviedField(varName: 'FILE_NAME')
  static const String fileName = _Env.fileName;
  @EnviedField(varName: 'PATH_FILE_TMP')
  static const String pathFileTmp = _Env.pathFileTmp;
  @EnviedField(varName: 'PATH_FILE_DOCKER')
  static const String pathFileDocker = _Env.pathFileDocker;
}
