import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityService {
  static final Connectivity _connectivity = Connectivity();
  static StreamSubscription<ConnectivityResult>? _connectivitySubscription;

  static void listen(Function(bool isConnected) callback) {
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen((result) async {
      if (result == ConnectivityResult.none) {
        callback(false);
      } else {
        callback(true);
      }
    });
  }

  static void dispose() {
    _connectivitySubscription?.cancel();
  }
}



