import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';

/// Service Locator Instance
final sl = GetIt.instance;

Future<void> init() async {
  //! Features

  //! Core

  //! External
  sl.registerLazySingleton(() => DataConnectionChecker());
}
