part of 'dynamic_button_bloc.dart';
abstract class DynamicButtonEvent extends Equatable {
  const DynamicButtonEvent();

  @override
  List<Object> get props => [];
}

class ChangeDynamicButtonEvent extends DynamicButtonEvent {
  final int index;
  const ChangeDynamicButtonEvent({required this.index});
  @override
  // TODO: implement props
  List<Object> get props => [index];
}
