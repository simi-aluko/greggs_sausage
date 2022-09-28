import 'package:greggs_susage/domain/entities/sausage_roll_entity.dart';

class SausageRollBasket {
  final double total;
  final List<SausageRollEntity> basketItems;

  SausageRollBasket({required this.total, required this.basketItems});
}