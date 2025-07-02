class CardModel {
  final String id;
  final String question;
  final String answer;

  CardModel({
    required this.id,
    required this.question,
    required this.answer,
  });

  factory CardModel.fromMap(Map<String, dynamic> map, String id) {
    return CardModel(
      id: id,
      question: map['question'] ?? '',
      answer: map['answer'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'question': question,
      'answer': answer,
    };
  }
}
