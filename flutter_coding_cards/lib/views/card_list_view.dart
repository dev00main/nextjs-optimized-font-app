import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/card_bloc.dart';
import '../models/card_model.dart';

class CardListView extends StatefulWidget {
  @override
  _CardListViewState createState() => _CardListViewState();
}

class _CardListViewState extends State<CardListView> {
  @override
  void initState() {
    super.initState();
    context.read<CardBloc>().add(LoadCardsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Coding Cards'),
      ),
      body: BlocBuilder<CardBloc, CardState>(
        builder: (context, state) {
          if (state is CardLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is CardLoaded) {
            return ListView.builder(
              itemCount: state.cards.length,
              itemBuilder: (context, index) {
                final CardModel card = state.cards[index];
                return Card(
                  margin: EdgeInsets.all(8),
                  child: ListTile(
                    title: Text(card.question),
                    subtitle: Text(card.answer),
                  ),
                );
              },
            );
          } else if (state is CardError) {
            return Center(child: Text(state.message));
          }
          return Center(child: Text('No cards found.'));
        },
      ),
    );
  }
}
