import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

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
              return Card(
                margin: EdgeInsets.all(4),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 15,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Theme.of(context).primaryColor,
                          width: 2,
                        ),
                      ),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        '${transactions[index].amount.toStringAsFixed(0)}đ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            transactions[index].title,
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          Text(
                            DateFormat.yMMMd()
                                .format(transactions[index].dateTime),
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    MediaQuery.of(context).size.width > 460
                        ? TextButton.icon(
                            onPressed: () => deleteTX(transactions[index].id),
                            icon: Icon(Icons.delete),
                            label: Text('Xóa'),
                            style: TextButton.styleFrom(
                              primary: Colors.blueGrey,
                            ),
                          )
                        : IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () => deleteTX(transactions[index].id),
                            color: Theme.of(context).errorColor,
                          ),
                  ],
                ),
              );
            },
            itemCount: transactions.length,
          );
  }
}
