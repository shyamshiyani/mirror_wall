import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class ConectivityCheakProvider extends ChangeNotifier {
  bool isConnection = false;

  void IsConnect() {
    Stream<List<ConnectivityResult>> stream =
        Connectivity().onConnectivityChanged;

    stream.listen(
      (List<ConnectivityResult> result) {
        if (result.contains(ConnectivityResult.mobile) ||
            result.contains(ConnectivityResult.wifi) ||
            result.contains(ConnectivityResult.vpn)) {
          isConnection = true;
        } else {
          isConnection = false;
        }
        notifyListeners();
      },
    );
  }
}
