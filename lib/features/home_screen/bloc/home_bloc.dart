import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:spade_project/features/home_screen/models/availble_stocks.dart';

import '../../../utils/utils.export.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeEvent>((event, emit) async {
      if(event is RequestAvailableStocks){
        AvailableStocks availableStocks;
        final res = await RestApiService.get(ApiPaths.availableStocks,isNewHeader:true);
        availableStocks = AvailableStocks.fromJson(json.decode(res.body));
        print("asfac");
        log(res.body);
        emit(GetAllAvailableStocks(availableStocks:availableStocks));
      }
    });
  }
}
