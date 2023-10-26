part of 'socket_bloc.dart';

@immutable
abstract class SocketState {}

class SocketInitial extends SocketState {}
class SocketUpdatedTimeState extends SocketState {

  final SocketUpdatedTime socketUpdatedTime;
  SocketUpdatedTimeState({required this.socketUpdatedTime});

}
