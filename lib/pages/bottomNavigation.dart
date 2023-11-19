import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home.dart';
import 'package:flutter_application_1/pages/order.dart';
import 'package:flutter_application_1/pages/profile.dart';

import 'wallet.dart';


class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int currentTabIndex = 0;
  late List<Widget> pages;
  late Widget currentPage;
  late Home homepage;
  late ProfileScreen profile;
  late Order order;
  late Wallet wallet;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homepage = Home();
    order = Order();
    profile = ProfileScreen();
    order = Order();
    wallet = Wallet();
    pages = [homepage, order, wallet, profile];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
          height: 65,
          backgroundColor: Colors.white,
          color: Colors.black,
          animationDuration: Duration(milliseconds: 500),
          onTap: (index) {
            setState(() {
              currentTabIndex = index;
            });
          },
          items: [
            Icon(
              Icons.home_outlined,
              color: Colors.white,
            ),
            Icon(
              Icons.shopping_bag_outlined,
              color: Colors.white,
            ),
            Icon(
              Icons.wallet_outlined,
              color: Colors.white,
            ),
            Icon(
              Icons.person_outline_outlined,
              color: Colors.white,
            ),
          ]),
      body: pages[currentTabIndex],
    );
  }
}
