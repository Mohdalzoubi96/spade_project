import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'screen_handle_state.dart';

class ScreenHandleCubit extends Cubit<ScreenHandleState> {
  ScreenHandleCubit() : super(ScreenHandleInitial());

  void emitLoading(){
    emit(ScreenHandleLoading());
  }

  void emitSuccess(){
    emit(ScreenHandleSuccess());
  }
}
