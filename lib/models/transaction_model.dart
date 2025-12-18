class Transaction {
  final String id;
  final String title;
  final String date;
  final double amount;
  final String iconDetails; // Ideally an IconData or asset path, simplified string for now (e.g., 'coffee')
  final bool isIncome;

  Transaction({
    required this.id,
    required this.title,
    required this.date,
    required this.amount,
    this.iconDetails = 'shopping_bag',
    this.isIncome = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'date': date,
      'amount': amount,
      'iconDetails': iconDetails,
      'isIncome': isIncome,
    };
  }

  factory Transaction.fromMap(Map<String, dynamic> map) {
    return Transaction(
      id: map['id'],
      title: map['title'],
      date: map['date'],
      amount: map['amount'],
      iconDetails: map['iconDetails'],
      isIncome: map['isIncome'],
    );
  }
}
