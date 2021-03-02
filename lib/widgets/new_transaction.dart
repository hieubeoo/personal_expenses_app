import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleControler = TextEditingController();
  final amountControler = TextEditingController();
  final Function addTx;

  NewTransaction(this.addTx);
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
              // onChanged: (value) => titleInput = value,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Số tiền'),
              controller: amountControler,
              // onChanged: (value) => amountInput = value,
            ),
            FlatButton(
              onPressed: () {
                addTx(
                  titleControler.text,
                  double.parse(amountControler.text),
                );
              },
              child: Text('Thêm'),
              textColor: Colors.purple,
            )
          ],
        ),
      ),
    );
  }
}
