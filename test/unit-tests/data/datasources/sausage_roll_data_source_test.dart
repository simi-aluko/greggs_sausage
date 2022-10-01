import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:greggs_susage/core/strings.dart';
import 'package:greggs_susage/data/datasources/sausage_roll_datasource.dart';
import 'package:greggs_susage/data/models/sausage_roll_model.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../data/test_data.dart';
import 'sausage_roll_data_source_test.mocks.dart';

@GenerateMocks([File])
void main() {
  final mockFile = MockFile();
  final jsonData = readFileToString('test/data/sausage_roll.json');
  final datasource = SausageRollDataSourceImpl(jsonData: jsonData);

  test('should return SausageRollModel from json', () async {
    // arrange
    List<SausageRollModel> sausageRollModels =
    json.decode(jsonData)[strArticles]
        .map<SausageRollModel>((article) => SausageRollModel.fromJson(article))
        .toList();

    // act
    List<SausageRollModel> result = await datasource.getSausageRolls();

    // assert
    expect(result, equals(sausageRollModels));
  });
}