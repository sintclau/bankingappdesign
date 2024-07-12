import 'package:banking_app/design/widgets/card.dart';
import 'package:banking_app/design/widgets/icon_button.dart';
import 'package:banking_app/design/widgets/tool_card.dart';
import 'package:banking_app/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final double _accountBalance = 683.85;
  String _cardType = 'Mastercard';

  void _showCards() {
    _cardType = 'Mastercard';
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return Container(
            height: 370,
            width: double.infinity,
            color: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Column(
                children: [
                  CarouselSlider(
                    options: CarouselOptions(
                      height: 189,
                      enableInfiniteScroll: false,
                      initialPage: 0,
                      viewportFraction: 0.8,
                      enlargeCenterPage: true,
                      onPageChanged: (index, reason) {
                        setState(() {
                          switch (index) {
                            case 0:
                              _cardType = 'Mastercard';
                              break;
                            case 1:
                              _cardType = 'Visa';
                              break;
                          }
                        });
                      },
                    ),
                    items: [
                      BankCard(cardType: 'mastercard'),
                      BankCard(cardType: 'visa'),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    _cardType,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white.withOpacity(0.6)),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Swipe to change cards',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.white.withOpacity(0.6)),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedCardType = _cardType.toLowerCase();
                      });
                      Navigator.pop(context);
                      Navigator.pop(context);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.purpleAccent.withOpacity(0.3)),
                      minimumSize: MaterialStatePropertyAll(const Size(20, 30)),
                    ),
                    child: const Text('Select'),
                  ),
                ],
              ),
            ),
          );
      });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 20, 9, 77),
          // image: DecorationImage(
          //   image: AssetImage('lib/design/assets/home_background.jpg'),
          //   fit: BoxFit.cover,
          // ),
          // gradient: LinearGradient(
          //   stops: [0, 0.4, 0.8],
          //   colors: [
          //     // Color.fromARGB(255, 101, 198, 222),
          //     // Color.fromARGB(255, 50, 7, 85),
          //     Colors.white.withAlpha(230),
          //     Colors.blue.shade400,
          //     Colors.purple.shade800,
          //   ],
          //   begin: Alignment.topLeft,
          //   end: Alignment.bottomRight,
          // ),
        ),
        child: Stack(
          children: [
            const Positioned(
              top: 47,
              left: 30,
              child: CustomIconButton(
                hasGradient: true,
                icon: Image(image: AssetImage('lib/design/assets/avatar.png'), width: 35, height: 35, fit: BoxFit.cover),
                padding: 8,
                color1: Color.fromARGB(255, 16, 173, 216),
                color2: Color.fromARGB(255, 159, 221, 230),
              ),
            ),
            const Positioned(
              top: 50,
              right: 20,
              child: CustomIconButton(
                hasGradient: false,
                icon: Icon(Icons.notifications, size: 35),
              )
            ),
            const Positioned(
              top: 50,
              right: 70,
              child: CustomIconButton(
                hasGradient: false,
                icon: Icon(Icons.settings, size: 35),
              )
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.only(top: 115.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.12, right: MediaQuery.of(context).size.width * 0.12),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Balance',
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white.withOpacity(0.6)),
                          ),
                          Text(
                            '$_accountBalance\$',
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Icon(Icons.arrow_upward, color: Color.fromARGB(255, 140, 255, 138), size: 35,),
                                  const SizedBox(width: 10),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Income',
                                        style: Theme.of(context).textTheme.titleSmall
                                      ),
                                      Text(
                                        '\$1,200',
                                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white.withOpacity(0.6)),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(width: 45),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(Icons.arrow_downward, color: Color.fromARGB(255, 215, 88, 3), size: 35),
                                  const SizedBox(width: 10),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Expenses',
                                        style: Theme.of(context).textTheme.titleSmall
                                      ),
                                      Text(
                                        '\$1,200',
                                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white.withOpacity(0.6)),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Debit Cards',
                                style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white.withOpacity(0.6)),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  _showCards();
                                },
                                style: ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(Colors.purpleAccent.withOpacity(0.3)),
                                  minimumSize: MaterialStatePropertyAll(const Size(20, 30)),
                                ),
                                child: Text(
                                  'View all',
                                  style: Theme.of(context).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          BankCard(
                            cardType: selectedCardType,
                          ),
                          SizedBox(height: 30),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.12),
                          child: Text(
                            'Fast access tools',
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white.withOpacity(0.6)),
                          ),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          height: 150,
                          child: ListView(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.12),
                                child: ToolCard('Financial Insights', Icons.bar_chart_rounded),
                              ),
                              ToolCard('Transfer Money', Icons.money_rounded),
                              Padding(
                                padding: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.08),
                                child: ToolCard('Assistance Desk', Icons.help_rounded),
                              ),
                            ]
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            // Column(
            //   mainAxisAlignment: MainAxisAlignment.end,
            //   children: [
            //     ElevatedButton(
            //       onPressed: () {
            //         Navigator.pushNamed(context, '/login');
            //       },
            //       child: const Text('Login'),
            //     ),
            //     ElevatedButton(
            //       onPressed: () {
            //         Navigator.pushNamed(context, '/register');
            //       },
            //       child: const Text('Register'),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}