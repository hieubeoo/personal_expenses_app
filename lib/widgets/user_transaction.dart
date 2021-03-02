import 'package:flutter/material.dart';
import './new_transaction.dart';
import './transaction_list.dart';
import '../models/transaction.dart';

class UserTransaction extends StatefulWidget {
  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> _userTransactions = [
    Transaction(
      id: 't1',
      title: 'Giày',
      amount: 1400000,
      dateTime: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Quần Jeans',
      amount: 350000,
      dateTime: DateTime.now(),
    ),
    Transaction(
      id: 't3',
      title: 'Áo sơ mi',
      amount: 400000,
      dateTime: DateTime.now(),
    ),
  ];
  void _addNewTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
      id: DateTime.now().toString(),
      amount: txAmount,
      title: txTitle,
      dateTime: DateTime.now(),
    );
    setState(() {
      _userTransactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(_addNewTransaction),
        TransactionList(_userTransactions),
      ],
    );
  }
}
