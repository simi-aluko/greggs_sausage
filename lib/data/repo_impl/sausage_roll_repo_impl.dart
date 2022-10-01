import 'package:greggs_susage/data/models/sausage_roll_model.dart';
import 'package:greggs_susage/domain/entities/sausage_roll_entity.dart';
import 'package:greggs_susage/domain/repositories/sausage_roll_repository.dart';

import '../datasources/sausage_roll_datasource.dart';

class SausageRollRepositoryImpl extends SausageRollRepository {
  final SausageRollDataSource dataSource;

  SausageRollRepositoryImpl({required this.dataSource});

  @override
  Future<List<SausageRollEntity>> getSausageRolls() async {
    List<SausageRollModel> sausageRollModels = await dataSource.getSausageRolls();

    List<SausageRollEntity> sausageRollEntities = sausageRollModels.map<SausageRollEntity>((e) => SausageRollEntity(articleName: e
        .articleName, availableFrom: e.availableFrom, availableUntil: e.availableUntil, eatOutPrice: e.eatOutPrice,
        eatInPrice: e.eatInPrice, dayParts: e.dayParts, customerDescription: e.customerDescription, imageUri: e
            .imageUri, thumbnailUri: e.thumbnailUri)).toList();
    return Future.value(sausageRollEntities);
  }
}