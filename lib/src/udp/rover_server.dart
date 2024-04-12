import "dart:io";
import "package:meta/meta.dart";
import "package:burt_network/generated.dart";

import "rover_heartbeats.dart";
import "burt_protocol.dart";
import "rover_logger.dart";
import "socket_info.dart";

abstract class RoverServer extends BurtUdpProtocol with RoverHeartbeats, RoverLogger {
  RoverServer({
    required super.port, 
    required super.device,
    super.quiet,
  });
  
  @override
  void onWrapper(WrappedMessage wrapper, SocketInfo source) {
    if (wrapper.name == UpdateSetting().messageName) {
      final settings = UpdateSetting.fromBuffer(wrapper.data);
      updateSettings(settings);
    } else {
      super.onWrapper(wrapper, source);
    }
  }

  @mustCallSuper
  Future<void> updateSettings(UpdateSetting settings) async {
    sendMessage(settings);
    if (settings.status == RoverStatus.POWER_OFF) {
      logger.critical("Shutting down...");
      try {
        await onShutdown().timeout(const Duration(seconds: 5));
      } catch (error) {
        logger.critical("Error when shutting down: $error");
      }
      if (!Platform.isLinux) exit(0);
      await Process.run("sudo", ["shutdown", "now"]);
    } else if (settings.status == RoverStatus.RESTART) {
      await restart();
    }
  }

  Future<void> restart();
  Future<void> onShutdown();
}
