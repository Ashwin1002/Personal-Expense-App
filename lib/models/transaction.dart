import 'package:flutter/foundation.dart';

class Transaction {

  final String id;
  final String title;
  final double expenses;
  final DateTime dateTime;

  Transaction({
    @required this.id,
    @required this.title,
    @required this.expenses,
    @required this.dateTime,
  });

}