import 'package:advicer/0_data/datasources/advice_remote_datasource.dart';
import 'package:advicer/0_data/repositories/advice_repo_impl.dart';
import 'package:advicer/1_domain/repositories/advice_repo.dart';
import 'package:advicer/1_domain/usecases/advice_usecases.dart';
import 'package:advicer/2_application/pages/advice/cubit/advicer_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final serviceLocator = GetIt.I; // I == instance

Future<void> init() async {
  //? application layer
  // Factory = every time a new/fresh instance of that class
  serviceLocator.registerFactory(
    () => AdvicerCubit(
      adviceUseCases: serviceLocator(),
    ),
  );

  // ? domain layer
  serviceLocator.registerFactory(
    () => AdviceUseCases(
      adviceRepo: serviceLocator(),
    ),
  );

  // ? data layer
  serviceLocator.registerFactory<AdviceRepo>(
    () => AdviceRepoImpl(
      adviceRemoteDatasource: serviceLocator(),
    ),
  );
  serviceLocator.registerFactory<AdviceRemoteDatasource>(
    () => AdviceRemoteDatasourceImpl(
      client: serviceLocator(),
    ),
  );

  // ? external
  serviceLocator.registerFactory(() => http.Client());
}
