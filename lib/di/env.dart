import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied()
abstract class Env {
  @EnviedField(varName: 'IP')
  static const String ip = _Env.ip;
  @EnviedField(varName: 'PORT')
  static const String port = _Env.port;
  @EnviedField(varName: 'USERNAME_SSH')
  static const String usernameSsh = _Env.usernameSsh;
  @EnviedField(varName: 'PASSWORD_SSH')
  static const String passwordSsh = _Env.passwordSsh;
  @EnviedField(varName: 'CONTAINER_ID')
  static const String containerId = _Env.containerId;
  @EnviedField(varName: 'FILE_NAME')
  static const String fileName = _Env.fileName;
  @EnviedField(varName: 'PATH_FILE')
  static const String pathFile = _Env.pathFile;
}
