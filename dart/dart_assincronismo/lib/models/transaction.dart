class Transaction {
  String id;
  String senderAccountId;
  String receiverAccountId;
  double amount;
  DateTime date;
  double taxes;

  Transaction({
    required this.id,
    required this.senderAccountId,
    required this.receiverAccountId,
    required this.amount,
    required this.date,
    required this.taxes,
  });

  factory Transaction.fromMap(Map<String, dynamic> map) {
    return Transaction(
      id: map['id'] as String,
      senderAccountId: map['senderAccountId'] as String,
      receiverAccountId: map['receiverAccountId'] as String,
      amount: (map['amount'] as num).toDouble(),
      date: DateTime.parse(map['date'] as String),
      taxes: (map['taxes'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'senderAccountId': senderAccountId,
      'receiverAccountId': receiverAccountId,
      'amount': amount,
      'date': date.toIso8601String(),
      'taxes': taxes,
    };
  }
}
