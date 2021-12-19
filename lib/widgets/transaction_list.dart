import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {

  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 400,
      child: ListView.builder(
        itemBuilder: (context, index){
          return Card(
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(
                      vertical: 10, horizontal: 15),
                  child: Text(
                    //tx.expenses.toString(),
                    '\$${transactions[index].expenses.toStringAsFixed(2)}', // toStringAsFixed helps to set the decimal unit to 2
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).primaryColor,
                        width: 2.0,
                      )),
                  padding: EdgeInsets.all(10.0),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      transactions[index].title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17.0,
                      ),
                    ),
                    Text(
                      DateFormat.yMMMMd().format(transactions[index].dateTime),
                      style: const TextStyle(
                          fontSize: 12.0, color: Colors.grey),
                    )
                  ],
                ),
              ],
            ),
          );
        },
        itemCount: transactions.length,
      ),
    );
  }
}
