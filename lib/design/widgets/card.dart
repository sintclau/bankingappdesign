import 'package:flutter/material.dart';

class BankCard extends StatefulWidget {
  final String cardType;

  const BankCard({required this.cardType, Key? key}) : super(key: key);

  @override
  BankCardState createState() => BankCardState(cardType);
}

class BankCardState extends State<BankCard> {
  final String cardType;
  
  BankCardState(this.cardType);
  
  @override
  Widget build(BuildContext context) {
    if (cardType == 'visa') {
      return Container(
        width: 300,
        height: 189,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('lib/design/assets/credit_card_visa.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 110,
              left: 20,
              child:  Text(
                '**** **** **** 3495',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white),
              ),
            ),
            Positioned(
              top: 145,
              left: 20,
              child:  Text(
                'MICHAEL JACKSON',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white),
              ),
            ),
            Positioned(
              top: 145,
              right: 50,
              child:  Text(
                '04/26',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white),
              ),
            ),
          ]
        ),
      );
    } else if (cardType == 'mastercard') {
      return Container(
        width: 300,
        height: 189,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('lib/design/assets/credit_card_mastercard.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 110,
              left: 20,
              child:  Text(
                '**** **** **** 6594',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white),
              ),
            ),
            Positioned(
              top: 145,
              left: 20,
              child:  Text(
                'MICHAEL JACKSON',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white),
              ),
            ),
            Positioned(
              top: 145,
              right: 50,
              child:  Text(
                '12/28',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white),
              ),
            ),
          ]
        ),
      );
    } else {
      return Text('Card not found!');
    }
  }
}