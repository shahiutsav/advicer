part of 'advicer_bloc.dart';

@immutable
abstract class AdvicerEvent extends Equatable {
  const AdvicerEvent();

  @override
  List<Object> get props => [];
}

class AdviceRequestedEvent extends AdvicerEvent {}
