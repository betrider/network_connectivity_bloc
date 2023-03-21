import 'package:connectivity_checker/bloc/network_bloc.dart';
import 'package:connectivity_checker/bloc/network_event.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkHelper {
  
  static void checkConnectivity() async {
    ConnectivityResult result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.none) {
      NetworkBloc().add(NetworkNotify());
    }
  }

  static void observeNetwork() {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if (result == ConnectivityResult.none) {
        NetworkBloc().add(NetworkNotify());
      } else {
        NetworkBloc().add(NetworkNotify(isConnected: true));
      }
    });
  }
}
