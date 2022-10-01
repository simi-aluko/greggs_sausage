import 'package:flutter_test/flutter_test.dart';
import 'package:greggs_susage/data/models/sausage_roll_model.dart';
import 'package:greggs_susage/domain/entities/sausage_roll_entity.dart';
import 'package:greggs_susage/domain/repositories/sausage_roll_repository.dart';
import 'package:greggs_susage/ui/bloc/sausage_roll_bloc.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import '../../../../data/test_data.dart';
import 'article_list_bloc_test.mocks.dart';

@GenerateMocks([SausageRollRepository])
void main() {
  final mockRepository = MockSausageRollRepository();
  final sausageRollListBloc = SausageRollBloc(sausageRollRepository : mockRepository);

  test('initial state should be SausageRollListInitialState', () {
    expect(sausageRollListBloc.state, equals(SausageRollListInitialState()));
  });

  group('Sausage roll lists', () {
    test(
      'should get List<SausageRollEntity> from repository',
          () async {
        // arrange
        when(mockRepository.getSausageRolls()).thenAnswer((_) async => [sausageRollEntity1]);
        // act
        sausageRollListBloc.add(GetSausageRollsEvent());
        await untilCalled(mockRepository.getSausageRolls());
        // assert
        verify(mockRepository.getSausageRolls());
      },
    );

    test(
      'should emit [Loading, Loaded] when SausageRolls are gotten successfully', () async {
      // arrange
      when(mockRepository.getSausageRolls()).thenAnswer((_) async => [sausageRollEntity1]);
      // assert later
      final expected = [SausageRollListLoadingState(), SausageRollListLoadedState(sausageRollEntities: [sausageRollEntity1])];
      expectLater(sausageRollListBloc.stream, emitsInOrder(expected));
      // act
      sausageRollListBloc.add(GetSausageRollsEvent());
    },
    );
  });

  group('Basket tests', () {

    test('should emit an empty basket initially when no sausage is added', (){
      // assert later
      final expected = [GetBasketLoadingState(), GetBasketLoadedState(sausageRollBasketEntity: sausageRollEmptyBasketEntity)];
      expectLater(sausageRollListBloc.stream, emitsInOrder(expected));

      // act
      sausageRollListBloc.add(GetBasketEvent());
    });

    test('should add item to basket', () {
      // assert later
      final expected = [GetBasketLoadingState(), GetBasketLoadedState(sausageRollBasketEntity: sausageRollFirstItemBasketEntity)];
      expectLater(sausageRollListBloc.stream, emitsInOrder(expected));

      // act
      sausageRollListBloc.add(AddSausageToBasketEvent(sausageRollEntity: sausageRollEntity1));
    });

    test('basket total should be addition of added sausageRoll prices', (){
      // assert later
      final expected = [GetBasketLoadingState(), GetBasketLoadedState(sausageRollBasketEntity: sausageRollMultipleItemsBasketEntity)];
      expectLater(sausageRollListBloc.stream, emitsInOrder(expected));

      // act
      sausageRollListBloc.add(AddSausageToBasketEvent(sausageRollEntity: sausageRollEntity2));
    });

    test('should remove item from basket', () {
      // assert later
      final expected = [GetBasketLoadingState(), GetBasketLoadedState(sausageRollBasketEntity: sausageRollFirstItemBasketEntity)];
      expectLater(sausageRollListBloc.stream, emitsInOrder(expected));

      // act
      sausageRollListBloc.add(RemoveSausageFromBasketEvent(sausageRollEntity: sausageRollEntity2));
    });
  });
}