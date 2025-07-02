part of 'card_bloc.dart';

abstract class CardState {}

class CardInitial extends CardState {}

class CardLoading extends CardState {}

class CardLoaded extends CardState {
  final List<CardModel> cards;

  CardLoaded(this.cards);
}

class CardError extends CardState {
  final String message;

  CardError(this.message);
}
