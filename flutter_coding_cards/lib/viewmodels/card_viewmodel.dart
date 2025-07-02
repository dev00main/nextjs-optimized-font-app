import 'package:flutter/material.dart';
import '../models/card_model.dart';
import '../repositories/card_repository.dart';

class CardViewModel extends ChangeNotifier {
  final CardRepository cardRepository;

  List<CardModel> _cards = [];
  List<CardModel> get cards => _cards;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _error;
  String? get error => _error;

  CardViewModel(this.cardRepository);

  Future<void> loadCards() async {
    _isLoading = true;
    notifyListeners();

    try {
      _cards = await cardRepository.fetchCards();
      _error = null;
    } catch (e) {
      _error = e.toString();
    }

    _isLoading = false;
    notifyListeners();
  }
}
