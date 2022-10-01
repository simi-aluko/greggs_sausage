import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:greggs_susage/domain/entities/basket_entity.dart';
import 'package:greggs_susage/domain/entities/sausage_roll_entity.dart';

import '../../domain/repositories/sausage_roll_repository.dart';

part 'sausage_roll_events.dart';
part 'sausage_roll_states.dart';

class SausageRollBloc extends Bloc<SausageRollEvent, SausageRollState> {
  final SausageRollRepository sausageRollRepository;
  final List<SausageRollEntity> basketList = [];

  SausageRollBloc({required this.sausageRollRepository}) : super(SausageRollListInitialState()) {
    on<GetSausageRollsEvent>(getSausageRolls);
    on<AddSausageToBasketEvent>(addSausageRollToBasket);
    on<GetBasketEvent>(getBasket);
    on<RemoveSausageFromBasketEvent>(removeSausageRollFromBasket);
  }

  getSausageRolls(GetSausageRollsEvent event, Emitter<SausageRollState> emitter) async {
    emit(SausageRollListLoadingState());
    final sausageRolls = await sausageRollRepository.getSausageRolls();
    emit(SausageRollListLoadedState(sausageRollEntities: sausageRolls));
  }

  getBasket(GetBasketEvent event, Emitter<SausageRollState> emitter){
    emit(GetBasketLoadingState());
    emit(GetBasketLoadedState(sausageRollBasketEntity: _getBasket()));
  }

  addSausageRollToBasket(AddSausageToBasketEvent event, Emitter<SausageRollState> emitter){
    emit(GetBasketLoadingState());
    basketList.add(event.sausageRollEntity);
    emit(GetBasketLoadedState(sausageRollBasketEntity: _getBasket()));
  }

  removeSausageRollFromBasket(RemoveSausageFromBasketEvent event, Emitter<SausageRollState> emitter){
    emit(GetBasketLoadingState());
    basketList.remove(event.sausageRollEntity);
    emit(GetBasketLoadedState(sausageRollBasketEntity: _getBasket()));
  }

  SausageRollBasketEntity _getBasket(){
    double totalPrice = basketList.map<double>((e){
      if(e.isEatIn) {
        return e.eatInPrice;
      } else {
        return e.eatOutPrice;
      }
    }).fold(0, (previousValue, element) => previousValue + element);

    SausageRollBasketEntity basket = SausageRollBasketEntity(total: totalPrice, basketItems: basketList);
    return basket;
  }
}
