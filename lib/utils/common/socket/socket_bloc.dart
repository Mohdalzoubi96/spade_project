import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socket_io_client/socket_io_client.dart';
import 'package:spade_project/utils/common/models/socket_updated_time.dart';

import '../../../features/home_screen/home.export.dart';
import '../../services/custom_navigation.dart';
import '../../utils.export.dart';

part 'socket_event.dart';

part 'socket_state.dart';

class SocketBloc extends Bloc<SocketEvent, SocketState> {
  late final Socket _socket;

  SocketBloc() : super(SocketInitial()) {
    on<SocketEvent>((event, emit) {
      if (event is InitSocketConnection) {
        _onInitSocketConnection(event, emit);
      }
      if (event is GetSocketEventTimeUpdated) {
        emit(
            SocketUpdatedTimeState(socketUpdatedTime: event.socketUpdatedTime));
      }
    });
  }

  Future<void> _onInitSocketConnection(
    InitSocketConnection event,
    Emitter<SocketState> emit,
  ) async {
    try {
      _socket = io(
        ApiPaths.socketBase,
        OptionBuilder().setTransports(['websocket']).setExtraHeaders(
            {"Cookie": event.setCookie}).build(),
      );

      /// UAE time is GMT+4

      Future.delayed(const Duration(seconds: 5), () {
        if (_socket.connected) {
          if (kDebugMode) {
            print('socket connected');
          }
          _socket.on(
            SocketEvents.authGetProfile,
            (data) => _onEventGetProfile(data),
          );

          _socket.on(
            SocketEvents.sessionTimeUpdated,
            (data) => _onEventTimeUpdated(data),
          );

          _socket.on(
            SocketEvents.unitsUpdated,
            (data) => _onEventUnitUpdated(data),
          );
        }
      });
    } catch (e) {
      if (kDebugMode) {
        print('Error connecting to socket: $e');
      }
    }
  }

  void _onEventGetProfile(dynamic data) {
    if (kDebugMode) {
      print('data -> $data');
    }
  }

  void _onEventTimeUpdated(dynamic data) {
    SocketUpdatedTime socketUpdatedTime;
    if(data['isBetween']){
      socketUpdatedTime = SocketUpdatedTime.fromJson(data);
    } else{
      socketUpdatedTime = SocketUpdatedTime.fromJsonWithNoData(data);
    }

    add(GetSocketEventTimeUpdated(socketUpdatedTime: socketUpdatedTime));
  }

  void _onEventUnitUpdated(dynamic data) {
    currentContext!.read<HomeBloc>().add(RequestAvailableStocks());
  }

  void disconnectFromSocket() {
    _socket.disconnect();
  }
}
