import 'package:flutter/material.dart';

import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key key,
    @required this.transaction,
    @required this.deleteTX,
  }) : super(key: key);

  final Transaction transaction;
  final Function deleteTX;

  @override
  Widget build(BuildContext context) {
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
              '${transaction.amount.toStringAsFixed(0)}đ',
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
                  transaction.title,
                  style: Theme.of(context).textTheme.headline6,
                ),
                Text(
                  DateFormat.yMMMd().format(transaction.dateTime),
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          MediaQuery.of(context).size.width > 460
              ? TextButton.icon(
                  onPressed: () => deleteTX(transaction.id),
                  icon: Icon(Icons.delete),
                  label: Text('Xóa'),
                  style: TextButton.styleFrom(
                    primary: Colors.blueGrey,
                  ),
                )
              : IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => deleteTX(transaction.id),
                  color: Theme.of(context).errorColor,
                ),
        ],
      ),
    );
  }
}
