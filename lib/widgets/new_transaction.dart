import 'dart:math';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;
  NewTransaction(this.addTx);
  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleControler = TextEditingController();
  final _amountControler = TextEditingController();
  DateTime _selectedDate;
  void _submitData() {
    if (_amountControler.text.isEmpty) {
      return;
    }
    final enteredTitle = _titleControler.text;
    final enteredAmount = double.parse(_amountControler.text);
    if (enteredAmount <= 0 || enteredTitle.isEmpty || _selectedDate == null) {
      return;
    }
    widget.addTx(
      enteredTitle,
      enteredAmount,
      _selectedDate,
    );
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Vật phẩm'),
                controller: _titleControler,
                onSubmitted: (_) => _submitData(),
                // onChanged: (value) => titleInput = value,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Số tiền'),
                controller: _amountControler,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => _submitData(),
                // onChanged: (value) => amountInput = value,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(_selectedDate == null
                        ? ''
                        : 'Ngày: ${DateFormat.yMMMd().format(_selectedDate)}'),
                  ),
                  TextButton(
                    onPressed: () => _presentDatePicker(),
                    child: Text('Chọn ngày'),
                  )
                ],
              ),
              ElevatedButton(
                onPressed: _submitData,
                child: Text(
                  'Thêm',
                  style: TextStyle(color: Colors.white),
                ),
                style: TextButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
