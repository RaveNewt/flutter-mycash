import 'package:flutter/material.dart';
import 'package:flutter_mycash/widget/theme.dart';
import 'package:google_fonts/google_fonts.dart';

class Transaction extends StatefulWidget {
  Transaction({Key? key}) : super(key: key);

  @override
  State<Transaction> createState() => _TransactionState();
}

class _TransactionState extends State<Transaction> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transaction'),
      ),
    );
  }
}