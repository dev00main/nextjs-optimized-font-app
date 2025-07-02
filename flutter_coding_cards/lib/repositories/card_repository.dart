import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/card_model.dart';

class CardRepository {
  final CollectionReference cardsCollection =
      FirebaseFirestore.instance.collection('coding_cards');

  Future<List<CardModel>> fetchCards() async {
    QuerySnapshot snapshot = await cardsCollection.get();
    return snapshot.docs
        .map((doc) => CardModel.fromMap(doc.data() as Map<String, dynamic>, doc.id))
        .toList();
  }
}
