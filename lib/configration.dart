import 'package:JoDija_DataSource/jodija_configration.dart';

class LogicConfigration extends DataSourceConfigration {
  setAppConfigration(ServiceEnvType senvType, SerViceAppType app,
      SerViceBackendState sBackendState) {
    envType = senvType == ServiceEnvType.prod ? EnvType.prod : EnvType.dev;
    appType = app == SerViceAppType.App ? AppType.App : AppType.DashBord;
    switch (sBackendState) {
      case SerViceBackendState.local:
        backendState = BackendState.local;
        break;
      case SerViceBackendState.remote_dev:
        backendState = BackendState.remote_dev;
        break;
      case SerViceBackendState.remote_prod:
        backendState = BackendState.remote_prod;
        break;
    }
  }


  BackendState isRemote() {
    return backendState;
  }
}

enum ServiceEnvType { prod, dev }

enum SerViceAppType { App, Dashboard }

enum SerViceBackendState { local, remote_dev, remote_prod }
