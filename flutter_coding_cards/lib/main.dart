import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';

import 'viewmodels/card_viewmodel.dart';
import 'views/card_list_view.dart';
import 'blocs/card_bloc.dart';
import 'repositories/card_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final CardRepository cardRepository = CardRepository();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<CardRepository>.value(value: cardRepository),
        ChangeNotifierProvider<CardViewModel>(
          create: (_) => CardViewModel(cardRepository),
        ),
      ],
      child: BlocProvider<CardBloc>(
        create: (context) => CardBloc(cardRepository),
        child: MaterialApp(
          title: 'Coding Cards',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: CardListView(),
        ),
      ),
    );
  }
}
