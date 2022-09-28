import '../models/sausage_roll_model.dart';

abstract class SausageRollDataSource {
  Future<List<SausageRollModel>> getSausageRolls();
}