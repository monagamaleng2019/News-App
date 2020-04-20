import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';

class ConnectionService with ChangeNotifier {
  StreamSubscription<ConnectivityResult> _subscription;

  ConnectionService() {
    _subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult connectivityResult) {
      _isConnected = connectivityResult == ConnectivityResult.mobile ||
          connectivityResult == ConnectivityResult.wifi;
    });

    Connectivity().checkConnectivity().then((onValue) => _isConnected =
        onValue == ConnectivityResult.wifi ||
            onValue == ConnectivityResult.mobile);
  }
  @override
  void dispose() {
    _subscription.cancel();
  }

  bool _isConnected = false;
  bool get isConnected => _isConnected;
}
