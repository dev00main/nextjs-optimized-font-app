import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../models/card_model.dart';
import '../repositories/card_repository.dart';

part 'card_event.dart';
part 'card_state.dart';

class CardBloc extends Bloc<CardEvent, CardState> {
  final CardRepository cardRepository;

  CardBloc(this.cardRepository) : super(CardInitial()) {
    on<LoadCardsEvent>((event, emit) async {
      emit(CardLoading());
      try {
        final cards = await cardRepository.fetchCards();
        emit(CardLoaded(cards));
      } catch (e) {
        emit(CardError('Failed to load cards'));
      }
    });
  }
}
