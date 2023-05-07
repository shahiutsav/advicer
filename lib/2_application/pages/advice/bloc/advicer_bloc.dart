import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'advicer_event.dart';
part 'advicer_state.dart';

class AdvicerBloc extends Bloc<AdvicerEvent, AdvicerState> {
  AdvicerBloc() : super(AdvicerInitial()) {
    on<AdviceRequestedEvent>((event, emit) async {
      emit(
        AdvicerStateLoading(),
      );

      // TODO: execute business logic
      // * example: get an advice
      debugPrint('fake get advice triggered');
      await Future.delayed(const Duration(seconds: 3), () {});
      debugPrint('got advice');
      // emit(const AdvicerStateLoaded(advice: 'fake advice to test bloc'));
      emit(const AdvicerStateError(message: 'Oops! Something went wrong.'));
    });
  }
}
