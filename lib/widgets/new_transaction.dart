import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleControler = TextEditingController();
  final amountControler = TextEditingController();

  void SubmitData() {
    final enteredTitle = titleControler.text;
    final enteredAmount = double.parse(amountControler.text);
    if (enteredAmount <= 0 || enteredTitle.isEmpty) {
      return;
    }
    widget.addTx(
      titleControler.text,
      double.parse(amountControler.text),
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Vật phẩm'),
              controller: titleControler,
              onSubmitted: (_) => SubmitData(),
              // onChanged: (value) => titleInput = value,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Số tiền'),
              controller: amountControler,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => SubmitData(),
              // onChanged: (value) => amountInput = value,
            ),
            FlatButton(
              onPressed: SubmitData,
              child: Text('Thêm'),
              textColor: Colors.purple,
            )
          ],
        ),
      ),
    );
  }
}
