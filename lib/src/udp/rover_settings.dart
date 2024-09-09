import "dart:io";

import "package:burt_network/generated.dart";

import "burt_socket.dart";

/// A mixin that handles [UpdateSetting] commands.
mixin RoverSettings on BurtSocket {
  /// Handles an [UpdateSetting] command and updates the appropriate setting.
  ///
  /// Also sends a handshake response to indicate the message was received.
  @override
  Future<void> onSettings(UpdateSetting settings) async {
    sendMessage(settings);
    if (settings.status == RoverStatus.POWER_OFF) {
      logger.critical("Shutting down...");
      try {
        await shutdown().timeout(const Duration(seconds: 5));
      } catch (error) {
        logger.critical("Error when shutting down: $error");
      }
      if (!Platform.isLinux) exit(0);
      await Process.run("sudo", ["shutdown", "now"]);
    } else if (settings.status == RoverStatus.RESTART) {
      await restart();
    }
  }

  /// Restarts this program, usually by disposing and re-initializing the collection.
  Future<void> restart() async {
    await collection?.dispose();
    await collection?.init();
  }

  /// Shuts down the program by disposing the collection.
  ///
  /// This gives any other parts of the rover a chance to shut down as well. For example,
  /// if the Subsystems program shuts down, the drive firmware would continue out of control.
  /// Overriding this function gives it the chance to stop the firmware first.
  Future<void> shutdown() async => await collection?.dispose();
}
