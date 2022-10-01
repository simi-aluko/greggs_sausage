part of 'sausage_roll_bloc.dart';

abstract class SausageRollEvent extends Equatable {
  const SausageRollEvent();
  @override
  List<Object?> get props => [];
}

class GetSausageRollsEvent extends SausageRollEvent {}

class AddSausageToBasketEvent extends SausageRollEvent {
  final SausageRollEntity sausageRollEntity;

  const AddSausageToBasketEvent({required this.sausageRollEntity});
  @override
  List<Object?> get props => [sausageRollEntity];
}

class RemoveSausageFromBasketEvent extends SausageRollEvent {
  final SausageRollEntity sausageRollEntity;

  const RemoveSausageFromBasketEvent({required this.sausageRollEntity});
  @override
  List<Object?> get props => [sausageRollEntity];
}

class GetBasketEvent extends SausageRollEvent {}