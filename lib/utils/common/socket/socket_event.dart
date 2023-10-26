part of 'socket_bloc.dart';

@immutable
abstract class SocketEvent {}

class InitSocketConnection extends SocketEvent{
  final String setCookie;
  InitSocketConnection(this.setCookie);
}

class GetSocketEventTimeUpdated extends SocketEvent{

  final SocketUpdatedTime socketUpdatedTime;
  GetSocketEventTimeUpdated({required this.socketUpdatedTime});

}
