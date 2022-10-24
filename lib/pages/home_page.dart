import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_wallet_app_ui/utils/my_button.dart';
import 'package:flutter_wallet_app_ui/utils/my_card.dart';
import 'package:flutter_wallet_app_ui/utils/my_list.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
// page _controller

  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.pink,
        child: Icon(Icons.monetization_on, size: 32),
      ),
      bottomNavigationBar: BottomAppBar(
          child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.home,
                  size: 32,
                  color: Colors.pink[200],
                )),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.settings,
                  size: 32,
                  color: Colors.pink[200],
                ))
          ],
        ),
      )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(children: [
            // appbar
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        "My ",
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Card",
                        style: TextStyle(fontSize: 28),
                      ),
                    ],
                  ),
                  // plus button
                  Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.grey[400], shape: BoxShape.circle),
                      child: Icon(Icons.add))
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),

            // Card view
            Container(
              height: 200,
              child: PageView(
                scrollDirection: Axis.horizontal,
                controller: _controller,
                children: [
                  MyCard(
                    balance: 5250.20,
                    cardNumber: 12345678,
                    expiryMonth: 10,
                    expiryYear: 24,
                    color: Colors.deepPurple[300],
                  ),
                  MyCard(
                    balance: 2212.20,
                    cardNumber: 12345678,
                    expiryMonth: 01,
                    expiryYear: 25,
                    color: Colors.blue[300],
                  ),
                  MyCard(
                    balance: 3122.20,
                    cardNumber: 12345678,
                    expiryMonth: 12,
                    expiryYear: 22,
                    color: Colors.green[300],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SmoothPageIndicator(
              controller: _controller,
              count: 3,
              effect: ExpandingDotsEffect(activeDotColor: Colors.grey.shade800),
            ),
            SizedBox(
              height: 25,
            ),
            // 3 buttons -> send + pay + bills
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // send button
                  MyButton(
                      iconImagePath: 'assets/icons/send-money.png',
                      buttonText: 'Send'),
                  // pay button

                  MyButton(
                      iconImagePath: 'assets/icons/credit-card.png',
                      buttonText: 'Pay'),
                  // bill button
                  MyButton(
                      iconImagePath: 'assets/icons/bill.png',
                      buttonText: 'Bills'),
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
            MyList(
              iconImagePath: "assets/icons/statistics.png",
              tileTitle: "Statistics",
              tileSubTitle: 'Payments and Income',
            ),
            MyList(
              iconImagePath: "assets/icons/transaction.png",
              tileTitle: "Transactions",
              tileSubTitle: 'Transactions History',
            ),

            // column -> stats + transactions
          ]),
        ),
      ),
    );
  }
}
