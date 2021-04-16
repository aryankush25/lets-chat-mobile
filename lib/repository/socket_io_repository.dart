import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:shared_preferences/shared_preferences.dart';

class SocketIoRepository {
  IO.Socket socket;

  init() async {
    print('Socket init');
    if (socket != null) print('socket.connected ${socket?.connected}');

    SharedPreferences prefs = await SharedPreferences.getInstance();

    String token = prefs.getString('authToken');

    if (token != null && token != '') {
      socket = IO.io(
        'http://192.168.1.8:7000',
        IO.OptionBuilder().setTransports(
          ['websocket'],
        ).setExtraHeaders(
          {'auth': token},
        ).build(),
      );

      print('#### socket $socket');

      socket.onConnect((_) {
        print('connect');
        socket.emit('msg', 'test');
      });

      socket.on('event', (data) => print(data));

      socket.onDisconnect((_) => print('disconnect'));

      socket.on('fromServer', (_) => print(_));

      socket.onError((error) => print('error $error'));
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
