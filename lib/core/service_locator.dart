import 'dart:io';

import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:greggs_susage/core/strings.dart';
import 'package:greggs_susage/data/datasources/sausage_roll_datasource.dart';
import 'package:greggs_susage/data/repo_impl/sausage_roll_repo_impl.dart';
import 'package:greggs_susage/domain/repositories/sausage_roll_repository.dart';
import 'package:greggs_susage/ui/bloc/sausage_roll_bloc.dart';

final sl = GetIt.instance;

init() async {
  sl.registerFactory(() => SausageRollBloc(sausageRollRepository: sl()));
  sl.registerFactory<SausageRollRepository>(() => SausageRollRepositoryImpl(dataSource: sl()));
  sl.registerFactory<SausageRollDataSource>(() => SausageRollDataSourceImpl(jsonData: sl()));
  final sausageRollJson = await rootBundle.loadString(strSausageRollJSONFilePath);
  sl.registerLazySingleton(() => sausageRollJson);
}