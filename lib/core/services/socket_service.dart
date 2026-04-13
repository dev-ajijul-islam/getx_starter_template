import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;
import '../network/api_endpoints.dart';

class SocketService extends GetxService {
  late io.Socket socket;
  final _isConnected = false.obs;
  bool get isConnected => _isConnected.value;

  Future<SocketService> init() async {
    _initSocket();
    return this;
  }

  void _initSocket() {
    try {
      socket = io.io(
        ApiEndpoints.baseUrl, // Or use a specific socket URL
        io.OptionBuilder()
            .setTransports(['websocket']) // for Flutter or Dart VM
            .enableAutoConnect()
            .setReconnectionAttempts(5)
            .setReconnectionDelay(2000)
            .build(),
      );

      socket.onConnect((_) {
        _isConnected.value = true;
        print('Socket connected');
      });

      socket.onDisconnect((_) {
        _isConnected.value = false;
        print('Socket disconnected');
      });

      socket.onConnectError((err) {
        _isConnected.value = false;
        print('Socket connect error: $err');
      });

      socket.onError((err) {
        print('Socket error: $err');
      });

    } catch (e) {
      print('Socket initialization error: $e');
    }
  }

  void emit(String event, dynamic data) {
    if (socket.connected) {
      socket.emit(event, data);
    } else {
      print('Cannot emit. Socket not connected.');
    }
  }

  void on(String event, Function(dynamic) handler) {
    socket.on(event, handler);
  }

  void off(String event) {
    socket.off(event);
  }

  @override
  void onClose() {
    socket.dispose();
    super.onClose();
  }
}
