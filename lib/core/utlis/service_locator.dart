import 'package:bookly_app/core/utlis/api_service.dart';
import 'package:bookly_app/features/home/data/repos/home_repo_impl.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

final getIt = GetIt.instance ;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(
    getIt.get<ApiService>(),
  ));
}