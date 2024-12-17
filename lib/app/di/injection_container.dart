import 'package:get_it/get_it.dart';
import 'package:main_character/app/router/app_router.dart';

final GetIt sl = GetIt.instance;

Future<void> initDependencies() async {
  sl.registerLazySingleton(() =>  AppRouter());
}
