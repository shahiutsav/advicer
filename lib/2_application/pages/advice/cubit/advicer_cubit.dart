import 'package:advicer/1_domain/failures/failures.dart';
import 'package:advicer/1_domain/usecases/advice_usecases.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'advicer_state.dart';

class AdvicerCubit extends Cubit<AdvicerCubitState> {
  AdvicerCubit({required this.adviceUseCases}) : super(AdvicerInitial());
  final AdviceUseCases adviceUseCases;
  // could also use other usecases

  void adviceRequested() async {
    emit(AdvicerStateLoading());
    final failureOrAdvice = await adviceUseCases.getAdvice();

    failureOrAdvice.fold(
      (failure) {
        emit(AdvicerStateError(message: _mapFailureToMessage(failure)));
      },
      (advice) {
        emit(AdvicerStateLoaded(advice: advice.advice));
      },
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return 'Server Failure';
      case CacheFailure:
        return 'Cache Failure';
      case NetworkFailure:
        return 'Network Failure';
      default:
        return 'Oops! Something went wrong.';
    }
  }
}
