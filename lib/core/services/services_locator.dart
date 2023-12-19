import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    sl.registerLazySingleton<SharedPreferences>(() => prefs);

    /// Bloc
    // sl.registerFactory(() => MoviesBloc(sl(), sl(), sl()));

    /// Use Cases
    // sl.registerLazySingleton(() => GetNowPlayingMoviesUseCase(sl()));

    /// Repository
    // sl.registerLazySingleton<BaseMoviesRepository>(
    //     () => MoviesRepository(sl()));

    /// Data Source
    // sl.registerLazySingleton<BaseMovieRemoteDataSource>(
    //     () => MovieRemoteDataSource());
  }
}
