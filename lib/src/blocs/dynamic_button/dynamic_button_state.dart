part of 'dynamic_button_bloc.dart';

class DynamicButtonState extends Equatable {
  final int index;

  const DynamicButtonState({required this.index});

  factory DynamicButtonState.initial() => const DynamicButtonState(index: 0);

  @override
  List<Object> get props => [index];

  @override
  bool get stringify => true;

  DynamicButtonState copyWith({
    int? index,
  }) {
    return DynamicButtonState(
        index: index??this.index,
    );
  }

}