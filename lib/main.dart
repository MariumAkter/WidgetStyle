import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_widgetstyling_app/transaction.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter app',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transaction = [
    Transaction(
        id: 't1',
        amount: 69.99,
        title:'New shoes',
        date: DateTime.now()
    ),
    Transaction(
        id: 't2',
        amount: 71.37,
        title:'Weekly groceries',
        date: DateTime.now()
    ),
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text('Flutter App'),
      ),
      body: Column (
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children:<Widget>[
          Container(
            width: double.infinity,
            child: Card(
              color: Colors.blue,
              child: Text('CHART'),
              elevation: 5,
            ),
          ),
         Column(
           children: transaction.map((tx){
             return Card(
               child: Row(children: <Widget> [
                 Container(
                   margin: EdgeInsets.symmetric(
                     vertical: 10,
                     horizontal: 15,
                   ),
                   decoration: BoxDecoration(
                     border: Border.all(
                       color: Colors.purple,
                       width: 2,
                     ),
                   ),
                   padding: EdgeInsets.all(10),
                   child: Text(
                       '\$${tx.amount}',
                     style: TextStyle(fontWeight: FontWeight.bold,
                     fontSize: 20,
                       color: Colors.purple,
                     ),
                 ),
                 ),
                 Column(children: <Widget> [
                   Text(tx.title,
                    style:TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black,
                     ),
                     ),
                   Text(
                     DateFormat.yMMMd().format(tx.date),
                       style:TextStyle(
                       color: Colors.grey,
                   ),),
                 ],)
               ],),
             );
           }).toList(),
         ),

        ],
      )
   );
  }
}
