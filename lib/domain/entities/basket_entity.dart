import 'package:equatable/equatable.dart';
import 'package:greggs_susage/domain/entities/sausage_roll_entity.dart';

class SausageRollBasketEntity extends Equatable {
  final double total;
  final List<SausageRollEntity> basketItems;

  const SausageRollBasketEntity({required this.total, required this.basketItems});

  @override
  List<Object?> get props => [total, basketItems];
}