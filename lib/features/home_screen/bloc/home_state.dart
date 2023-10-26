part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class GetAllAvailableStocks extends HomeState{
  AvailableStocks availableStocks;
  GetAllAvailableStocks({required this.availableStocks});
}