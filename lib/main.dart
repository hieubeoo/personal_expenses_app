import 'package:flutter/material.dart';
import './transaction.dart';
import 'package:intl/intl.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transaction = [
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(
              color: Colors.blue,
              child: Text('Chart'),
              elevation: 5,
            ),
          ),
          Column(
              children: transaction.map((tx) {
            // tx = transactions
            return Card(
                child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  decoration: BoxDecoration(
                      border: Border.all(
                    color: Colors.purple,
                    width: 2,
                  )),
                  padding: EdgeInsets.all(8),
                  child: Text(
                    '${tx.amount}đ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: Colors.purple,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      tx.title,
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      DateFormat().format(tx.dateTime),
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                )
              ],
            ));
          }).toList())
        ],
      ),
    );
  }
}
