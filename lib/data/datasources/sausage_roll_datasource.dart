import 'dart:convert';
import 'dart:io';

import '../../core/strings.dart';
import '../models/sausage_roll_model.dart';

abstract class SausageRollDataSource {
  Future<List<SausageRollModel>> getSausageRolls();
}

// read file and return list of sausage roll model
class SausageRollDataSourceImpl extends SausageRollDataSource {
  final File file;

  SausageRollDataSourceImpl({required this.file});

  @override
  Future<List<SausageRollModel>> getSausageRolls() {
    String sausageRollJsonString = file.readAsStringSync();

    List<SausageRollModel> sausageRollModels = json.decode(sausageRollJsonString)[strArticles]
        .map<SausageRollModel>((article) => SausageRollModel.fromJson(article))
        .toList();

    return Future.value(sausageRollModels);
  }

}