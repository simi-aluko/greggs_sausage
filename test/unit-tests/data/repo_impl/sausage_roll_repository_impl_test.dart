

import 'package:flutter_test/flutter_test.dart';
import 'package:greggs_susage/data/datasources/sausage_roll_datasource.dart';
import 'package:greggs_susage/data/models/sausage_roll_model.dart';
import 'package:greggs_susage/data/repo_impl/sausage_roll_repo_impl.dart';
import 'package:greggs_susage/domain/entities/sausage_roll_entity.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../data/test_data.dart';
import 'sausage_roll_repository_impl_test.mocks.dart';

@GenerateMocks([SausageRollDataSource])
void main() {
  final dataSourceMock = MockSausageRollDataSource();
  final sausageRollRepositoryImpl = SausageRollRepositoryImpl(dataSource: dataSourceMock);

  test('should return list of SausageRollEntity from datasource', () async {
    // arrange
    when(dataSourceMock.getSausageRolls()).thenAnswer((_) async => [sausageRollModel]);

    // act
    final result = await sausageRollRepositoryImpl.getSausageRolls();

    // assert
    expect(result, equals([sausageRollEntity1]));
  });
}