import 'package:advicer/1_domain/entities/advice_entity.dart';
import 'package:advicer/1_domain/failures/failures.dart';
import 'package:dartz/dartz.dart';

class AdviceUseCases {
  Future<Either<Failure, AdviceEntity>> getAdvice() async {
    await Future.delayed(const Duration(seconds: 3), () {});
    // call to repo went good -> return data not failure
    // return right(
    //   const AdviceEntity(
    //     id: 1,
    //     advice: 'This is an advice.',
    //   ),
    // );

    // call to repo went bad or logic had an error -> return failure not data
    return left(ServerFailure());
  }
}
