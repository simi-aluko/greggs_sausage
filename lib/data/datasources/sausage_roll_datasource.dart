import 'dart:convert';
import 'dart:io';

import '../../core/strings.dart';
import '../models/sausage_roll_model.dart';

abstract class SausageRollDataSource {
  Future<List<SausageRollModel>> getSausageRolls();
}


class SausageRollDataSourceImpl extends SausageRollDataSource {
  final String jsonData;

  SausageRollDataSourceImpl({required this.jsonData});

  @override
  Future<List<SausageRollModel>> getSausageRolls() {

    List<SausageRollModel> sausageRollModels = json.decode(jsonData)[strArticles]
        .map<SausageRollModel>((article) => SausageRollModel.fromJson(article))
        .toList();

    return Future.value(sausageRollModels);
  }

}