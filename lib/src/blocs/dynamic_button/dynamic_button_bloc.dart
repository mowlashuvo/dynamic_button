import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'dynamic_button_event.dart';
part 'dynamic_button_state.dart';

class DynamicButtonBloc extends Bloc<DynamicButtonEvent, DynamicButtonState> {
  DynamicButtonBloc() : super(DynamicButtonState.initial()){
   on<ChangeDynamicButtonEvent>(_changeButton);
  }
  void _changeButton(ChangeDynamicButtonEvent event, Emitter<DynamicButtonState> emit) {
    int index = event.index;
    emit(DynamicButtonState(index: index));
  }
}