import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class SocketIoRepository {
  IO.Socket socket;
  String _baseUrlWebsocket =
      '${env['SECURED_URL'] != 'false' ? 'https' : 'http'}://${env['BASE_URL']}';

  init() async {
    print('Socket init');
    if (socket != null) print('socket.connected ${socket?.connected}');

    SharedPreferences prefs = await SharedPreferences.getInstance();

    String token = prefs.getString('authToken');

    if (token != null && token != '') {
      print(_baseUrlWebsocket);

      socket = IO.io(
        _baseUrlWebsocket,
        IO.OptionBuilder().setTransports(
          ['websocket'],
        ).setAuth(
          {
            'token': token,
          },
        ).build(),
      );

      socket.onConnect((_) {
        print('connect');
        socket.emit('msg', 'test');
      });

      socket.on('event', (data) => print(data));

      socket.onDisconnect((_) => print('disconnect'));

      socket.on('fromServer', (_) => print(_));

      socket.onError((error) => print('error $error'));

      socket.onConnecting((data) {
        print('Connecting');
      });

      socket.onConnectError((error) {
        print('Error $error');
      });
    }
  }

  disconnect() {
    print('Socket disconnect');

    if (socket != null) {
      print('socket.connected ${socket?.connected}');

      if (socket.connected) {
        socket.disconnect();
      }
    }
  }
}
