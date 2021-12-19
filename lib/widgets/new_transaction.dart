import 'package:flutter/material.dart';


class NewTransaction extends StatefulWidget {

  final Function addTx;

  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleTextController = TextEditingController();

  final amountTextController = TextEditingController();

  void submitData() {
    final enteredTitle = titleTextController.text;
    final enteredAmount = double.parse(amountTextController.text);

    if(enteredTitle.isEmpty || enteredAmount <= 0){
      return;
    }

    widget.addTx(
       enteredTitle,
       enteredAmount,
    );

    Navigator.of(context).pop(); //closes the form when submitted
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              // onChanged: (val){
              //   textInput = val;
              // },
              controller: titleTextController,
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              // onChanged: (val){
              //   amountInput = val;
              // },
              controller: amountTextController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),
            ),
            FlatButton(
              child: Text('Add Transaction'),
              textColor: Colors.purple,
              onPressed: submitData,
            )
          ],
        ),
      ),
    );
  }
}
