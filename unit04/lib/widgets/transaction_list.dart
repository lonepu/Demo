import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? Column(
            children: <Widget>[
              Text(
                'No Transactions added yet!',
                style: Theme.of(context).textTheme.displayLarge,
              ),
              SizedBox(height: 20),
              Container(
                height: 200,
                child: Image.asset('assets/images/empty.png'),
              ),
            ],
          )
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return Card(
                // ဝိုင်းဝိုင်း လုံးလုံး လေးနဲ့ တန်ဖိုးကို ပြပြီး ကျန်တာလေးတွေကို title နဲ့ subtitle အနေနဲ့ ပြပေးပါတယ် တခုနဲ့ တခုကြားမှာ ရှင်းနေအောင်လို့ ပုံဖော်ထားပါတယ် မမှတ်မိမှာဆိုးလို့ မြန်မာလိုရေးထားတာ
                elevation: 5,
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: Padding(
                      padding: EdgeInsetsGeometry.all(6),
                      child: FittedBox(
                        child: Text('\$${transactions[index].amount}'),
                      ),
                    ),
                  ),
                  title: Text(
                    transactions[index].title,
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  subtitle: Text(
                    DateFormat.yMMMd().format(transactions[index].date),
                  ),
                  trailing: IconButton(
                    onPressed: () => deleteTx(transactions[index].id),
                    icon: Icon(
                      Icons.delete,
                      color: Theme.of(context).colorScheme.error,
                    ),
                  ),
                ),
              );
            },
            itemCount: transactions.length,
            // shrinkWrap: true,
            // physics: NeverScrollableScrollPhysics(),

            // Before I didnt place parent as Container
            // When I place container and give it height it will not give error
          );
  }
}
