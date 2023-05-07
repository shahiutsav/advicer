part of 'advicer_bloc.dart';

@immutable
abstract class AdvicerState extends Equatable {
  const AdvicerState();

  @override
  List<Object> get props => [];
}

class AdvicerInitial extends AdvicerState {}

class AdvicerStateLoading extends AdvicerState {}

class AdvicerStateLoaded extends AdvicerState {
  final String advice;

  const AdvicerStateLoaded({required this.advice});
}

class AdvicerStateError extends AdvicerState {
  final String message;

  const AdvicerStateError({required this.message});
}
