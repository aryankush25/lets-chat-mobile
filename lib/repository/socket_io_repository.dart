import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class SocketIoRepository {
  IO.Socket socket;
  String _baseUrlWebsocket =
      '${env['SECURED_URL'] != 'false' ? 'https' : 'http'}://${env['BASE_URL']}';

  init() async {
    print('Socket init function called');

    if (socket != null) {
      print('socket.connected ${socket?.connected}');
    }

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('authToken');

    if (token != null && token != '') {
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

      socket.onConnect((data) {
        print('onConnect $data');
        socket.emit('msg', 'test');
      });
      socket.onConnectError((error) {
        print('onConnectError $error');
      });
      socket.onConnectTimeout((error) {
        print('onConnectTimeout $error');
      });
      socket.onConnecting((data) {
        print('onConnecting $data');
      });
      socket.onDisconnect((data) {
        print('onDisconnect $data');
      });
      socket.onError((error) {
        print('error $error');
      });
      socket.onReconnect((data) {
        print('onReconnect $data');
      });
      socket.onReconnectAttempt((data) {
        print('onReconnectAttempt $data');
      });
      socket.onReconnectFailed((data) {
        print('onReconnectFailed $data');
      });
      socket.onReconnecting((data) {
        print('onReconnecting $data');
      });
      socket.onPing((data) {
        print('onPing $data');
      });
      socket.onPong((data) {
        print('onPong $data');
      });

      socket.on('message', (data) {
        print('message -> $data');
      });
    }
  }

  handleSendMessage(text, to) {
    socket.emitWithAck(
      'message',
      {
        'text': text,
        'to': to,
      },
      ack: (data) {
        print('#### message $data');

        bool isSuccess = data.isSuccess;

        if (!isSuccess) {
          print('#### error message $data');
        }
      },
    );
  }

  disconnect() {
    print('Socket disconnect function called');

    if (socket != null) {
      print('socket.connected ${socket?.connected}');

      if (socket.connected) {
        socket.disconnect();
      }
    }
  }
}
