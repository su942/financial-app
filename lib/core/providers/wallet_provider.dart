import 'package:flutter/material.dart';
import '../../models/transaction_model.dart';
import '../services/hive_service.dart';

class WalletProvider extends ChangeNotifier {
  final HiveService _hiveService = HiveService();
  double _balance = 0.00;
  List<Transaction> _transactions = [];

  double get balance => _balance;
  List<Transaction> get transactions => _transactions;

  WalletProvider() {
    _init();
  }

  Future<void> _init() async {
    await _hiveService.init();
    _loadTransactions();
  }

  void _loadTransactions() {
    final rawData = _hiveService.getTransactions();
    _transactions = rawData.map((e) => Transaction.fromMap(e)).toList();

    _balance = 0.0;
    for (var tx in _transactions) {
      if (tx.isIncome) {
        _balance += tx.amount;
      } else {
        _balance -= tx.amount;
      }
    }
    // Reverse to show newest first
    _transactions = _transactions.reversed.toList();
    notifyListeners();
  }

  void addTransaction(Transaction tx) async {
    _transactions.insert(0, tx);
    if (tx.isIncome) {
      _balance += tx.amount;
    } else {
      _balance -= tx.amount;
    }
    await _hiveService.saveTransaction(tx.toMap());
    notifyListeners();
  }
}
