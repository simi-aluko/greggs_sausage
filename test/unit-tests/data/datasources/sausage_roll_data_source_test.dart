import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:greggs_susage/core/strings.dart';
import 'package:greggs_susage/data/datasources/sausage_roll_datasource.dart';
import 'package:greggs_susage/data/models/sausage_roll_model.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../data/file_reader.dart';
import 'sausage_roll_data_source_test.mocks.dart';

@GenerateMocks([File])
void main() {
  final mockFile = MockFile();
  const filePath = 'test/data/sausage_roll.json';
  final datasource = SausageRollDataSourceImpl(file: mockFile);

  test('should return SausageRollModel from json', () async {
    // arrange
    when(mockFile.readAsStringSync()).thenReturn(readFileToString(filePath));

    List<SausageRollModel> sausageRollModels =
    json.decode(readFileToString(filePath))[strArticles]
        .map<SausageRollModel>((article) => SausageRollModel.fromJson(article))
        .toList();

    // act
    List<SausageRollModel> result = await datasource.getSausageRolls();

    // assert
    verify(mockFile.readAsStringSync());
    expect(result, equals(sausageRollModels));
  });
}