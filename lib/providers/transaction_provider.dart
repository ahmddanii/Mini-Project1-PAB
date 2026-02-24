import 'package:flutter/material.dart';
import '../models/transaction_model.dart';

class TransactionProvider extends ChangeNotifier {
  final List<TransactionModel> _transactions = [];

  List<TransactionModel> get transactions => _transactions;

  double get saldo {
    double income = 0;
    double expense = 0;

    for (var trx in _transactions) {
      if (trx.category == "Pemasukan") {
        income += trx.amount;
      } else {
        expense += trx.amount;
      }
    }

    return income - expense;
  }

  void addTransaction(TransactionModel transaction) {
    _transactions.add(transaction);
    notifyListeners();
  }

  void updateTransaction(String id, TransactionModel newTransaction) {
    final index = _transactions.indexWhere((trx) => trx.id == id);
    if (index != -1) {
      _transactions[index] = newTransaction;
      notifyListeners();
    }
  }

  void deleteTransaction(String id) {
    _transactions.removeWhere((trx) => trx.id == id);
    notifyListeners();
  }
}
