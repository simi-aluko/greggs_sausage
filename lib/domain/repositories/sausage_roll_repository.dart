import 'package:greggs_susage/domain/entities/sausage_roll_entity.dart';

abstract class SausageRollRepository {
 Future<List<SausageRollEntity>> getSausageRolls();
}