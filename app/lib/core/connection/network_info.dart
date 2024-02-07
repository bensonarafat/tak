import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'dart:developer' as developer;

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {
  final Connectivity connectivity;

  NetworkInfoImpl(this.connectivity);

  Future<void> initConnectivity() async {
    try {
      await connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      developer.log('Couldn\'t check connectivity status', error: e.toString());
      return;
    }
  }

  @override
  Future<bool> get isConnected async {
    try {
      ConnectivityResult result = await connectivity.checkConnectivity();
      return result != ConnectivityResult.none;
    } catch (e) {
      developer.log('Error checking connectivity status', error: e.toString());
      return false;
    }
  }
}
