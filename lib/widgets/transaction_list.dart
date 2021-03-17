import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';
import '../widgets/transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTX;
  TransactionList(this.transactions, this.deleteTX);
  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(
            builder: (ctx, constraints) {
              return Column(
                children: [
                  Text(
                    'Trống',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      height: constraints.maxHeight * 0.6,
                      child: Image.asset(
                        'assets/images/waiting.png',
                        fit: BoxFit.cover,
                      )),
                ],
              );
            },
          )
        : ListView.builder(
            itemBuilder: (ctx, index) {
              // return ListTile(
              //   // leading: CircleAvatar(
              //   //   radius: 40,
              //   //   child: Padding(
              //   //     padding: EdgeInsets.all(5),
              //   //     child: Text(
              //   //         '${transactions[index].amount.toStringAsFixed(0)}đ'),
              //   //   ),
              //   // ),
              //   title: Text(
              //     transactions[index].title,
              //     style: Theme.of(context).textTheme.headline6,
              //   ),
              //   subtitle: Text(
              //     DateFormat.yMEd().format(transactions[index].dateTime),
              //   ),
              // );
              return TransactionItem(
                  transaction: transactions[index], deleteTX: deleteTX);
            },
            itemCount: transactions.length,
          );
  }
}
