import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greggs_susage/core/service_locator.dart';
import 'package:greggs_susage/ui/screens/items_list.dart';

import '../ui/bloc/sausage_roll_bloc.dart';
import 'service_locator.dart' as service_locator;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await service_locator.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SausageRollBloc>(
      create: (context) => sl<SausageRollBloc>()..add(GetBasketEvent())..add(GetSausageRollsEvent()),
      child: MaterialApp(
        title: 'Greggs Sausage',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const ScreenItemsList(),
      ),
    );
  }
}
