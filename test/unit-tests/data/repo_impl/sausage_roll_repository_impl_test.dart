

import 'package:flutter_test/flutter_test.dart';
import 'package:greggs_susage/data/datasources/sausage_roll_datasource.dart';
import 'package:greggs_susage/data/models/sausage_roll_model.dart';
import 'package:greggs_susage/data/repo_impl/sausage_roll_repo_impl.dart';
import 'package:greggs_susage/domain/entities/sausage_roll_entity.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'sausage_roll_repository_impl_test.mocks.dart';

@GenerateMocks([SausageRollDataSource])
void main() {
  final dataSourceMock = MockSausageRollDataSource();
  final sausageRollRepositoryImpl = SausageRollRepositoryImpl(dataSource: dataSourceMock);

  const sausageRollModel = SausageRollModel(articleCode: "1", shopCode: "1", availableFrom: "1", availableUntil: "1"
      , eatOutPrice: 1.0, eatInPrice: 1.0, articleName: "1", dayParts: ["1"], internalDescription: "1",
      customerDescription: "1", imageUri: "imageUri", thumbnailUri: "thumbnailUri");

  SausageRollEntity sausageRollEntity = SausageRollEntity(articleName: sausageRollModel.articleName, availableFrom:
  sausageRollModel.availableFrom, availableUntil: sausageRollModel.availableUntil, eatOutPrice: sausageRollModel
      .eatOutPrice, eatInPrice: sausageRollModel.eatInPrice, dayParts: sausageRollModel.dayParts, customerDescription: sausageRollModel.customerDescription, imageUri: sausageRollModel.imageUri, thumbnailUri: sausageRollModel.thumbnailUri);

  test('should return list of SausageRollEntity from datasource', () async {
    // arrange
    when(dataSourceMock.getSausageRolls()).thenAnswer((_) async => [sausageRollModel]);

    // act
    final result = await sausageRollRepositoryImpl.getSausageRolls();

    // assert
    expect(result, equals([sausageRollEntity]));
  });
}