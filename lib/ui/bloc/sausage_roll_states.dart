part of 'sausage_roll_bloc.dart';

abstract class SausageRollState extends Equatable {
  const SausageRollState();
  @override
  List<Object> get props => [];
}

/// initial state
class SausageRollListInitialState extends SausageRollState {}


/// SausageRoll list
class SausageRollListLoadedState extends SausageRollState {
  final List<SausageRollEntity> sausageRollEntities;

  const SausageRollListLoadedState({required this.sausageRollEntities});

  @override
  List<Object> get props => [sausageRollEntities];
}

class SausageRollListLoadingState extends SausageRollState {}

class SausageRollListErrorState extends SausageRollState {
  final String error;

  const SausageRollListErrorState({required this.error});
}


/// Basket
class GetBasketLoadedState extends SausageRollState {
  final SausageRollBasketEntity sausageRollBasketEntity;

  const GetBasketLoadedState({required this.sausageRollBasketEntity});

  @override
  List<Object> get props => [sausageRollBasketEntity];
}

class GetBasketLoadingState extends SausageRollState {}

class GetBasketErrorState extends SausageRollState {
  final String error;

  const GetBasketErrorState({required this.error});
}




