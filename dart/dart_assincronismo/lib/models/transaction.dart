import 'dart:convert';

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

  Transaction copyWith({
    String? id,
    String? senderAccountId,
    String? receiverAccountId,
    double? amount,
    DateTime? date,
    double? taxes,
  }) {
    return Transaction(
      id: id ?? this.id,
      senderAccountId: senderAccountId ?? this.senderAccountId,
      receiverAccountId: receiverAccountId ?? this.receiverAccountId,
      amount: amount ?? this.amount,
      date: date ?? this.date,
      taxes: taxes ?? this.taxes,
    );
  }

  String toJson() => json.encode(toMap());

  factory Transaction.fromJson(String source) =>
      Transaction.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return '\nTransaction $id\nfrom: $senderAccountId to: $receiverAccountId\namount: $amount\ndate: $date\ntaxes: $taxes\n';
  }

  @override
  bool operator ==(covariant Transaction other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.senderAccountId == senderAccountId &&
        other.receiverAccountId == receiverAccountId &&
        other.amount == amount &&
        other.date == date &&
        other.taxes == taxes;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        senderAccountId.hashCode ^
        receiverAccountId.hashCode ^
        amount.hashCode ^
        date.hashCode ^
        taxes.hashCode;
  }
}
