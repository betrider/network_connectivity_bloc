import 'package:equatable/equatable.dart';

abstract class NetworkState extends Equatable {
  const NetworkState(this.previous);

  final NetworkState? previous;

  @override
  List<Object> get props => [];
}

class NetworkInitial extends NetworkState {
  const NetworkInitial() : super(null);
}

class NetworkSuccess extends NetworkState {
  const NetworkSuccess(super.previous);
}

class NetworkFailure extends NetworkState {
  final String message;
  const NetworkFailure(super.previous, this.message);
}