import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '/core/services/app_prefs.dart';
import '/features/auth/data/repository/auth_repository.dart';
import '/features/auth/data/repository/auth_repository_impl.dart';
import '/features/auth/presentation/view_models/login/login_cubit.dart';
import '/features/auth/presentation/view_models/register/register_cubit.dart';
import '/features/categories/data/repository/categories_repo.dart';
import '/features/categories/data/repository/categories_repo_impl.dart';
import '/features/categories/presentation/view_models/categories_cubit.dart';
import '/features/favorites/data/repository/favorite_repo.dart';
import '/features/favorites/data/repository/favorite_repo_impl.dart';
import '/features/favorites/presentation/view_models/favorite_cubit.dart';
import '/features/home/data/repository/home_repo.dart';
import '/features/home/data/repository/home_repo_impl.dart';
import '/features/home/presentation/view_models/home_cubit.dart';
import '/features/location/data/repository/locations_repo.dart';
import '/features/location/data/repository/locations_repo_impl.dart';
import '/features/location/presentation/view_models/locations_cubit.dart';
import '/features/products/data/repo/products_repo.dart';
import '/features/products/data/repo/products_repo_impl.dart';
import '/features/products/presentation/product_details/view_models/product_details_cubit.dart';
import '/features/profile/presentation/view_models/profile_cubit.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() async {
    /// Initialize SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();

    sl.registerLazySingleton<SharedPreferences>(() => prefs);

    /// Initialize AppPreferences
    sl.registerLazySingleton<AppPreferences>(() => AppPreferences());

    /// Blocs
    sl.registerFactory(() => LoginCubit(sl<AuthRepository>()));
    sl.registerFactory(() => RegisterCubit(sl<AuthRepository>()));
    sl.registerFactory(() => ProfileCubit(sl<AuthRepository>()));
    sl.registerFactory(() => HomeCubit(
          sl<HomeRepo>(),
          sl<CategoriesRepo>(),
          sl<ProductsRpo>(),
          sl<FavoriteRepo>(),
        ));
    sl.registerFactory(() => CategoriesCubit(sl<CategoriesRepo>()));
    sl.registerFactory(() => ProductDetailsCubit(sl<ProductsRpo>()));
    sl.registerFactory(() => FavoriteCubit(
          sl<ProductsRpo>(),
          sl<FavoriteRepo>(),
        ));
    sl.registerFactory(() => LocationsCubit(sl<LocationsRepo>()));

    /// Repositories
    sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl());
    sl.registerLazySingleton<HomeRepo>(() => HomeRepoImpl());
    sl.registerLazySingleton<CategoriesRepo>(() => CategoriesRepoImpl());
    sl.registerLazySingleton<ProductsRpo>(() => ProductsRpoImpl());
    sl.registerLazySingleton<FavoriteRepo>(() => FavoriteRepoImpl());
    sl.registerLazySingleton<LocationsRepo>(() => LocationsRepoImpl());
  }
}
