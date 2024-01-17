
import 'package:flutter/material.dart';
import 'package:flutter_assignment/customersPage.dart';
import 'package:flutter_assignment/jwelleryCardlist.dart';
import 'package:flutter_assignment/loginPage.dart';
import 'package:flutter_assignment/productListScreen.dart';
import 'package:provider/provider.dart';

import 'circularCardList.dart';
import 'customerProvider.dart';

class DashboardScreen extends StatefulWidget{
  const DashboardScreen({super.key});

  @override
  _dashboardScreen createState() => _dashboardScreen();
}

class _dashboardScreen extends State<DashboardScreen>{
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  // Icon? _getAppBarIcon() {
  //   switch (_currentIndex) {
  //     case 0:
  //     // For Product List tab
  //       return ;
  //     case 1:
  //     // For Customers tab
  //       return null;
  //   // Add more cases for additional tabs as needed
  //     default:
  //       return const Icon(Icons.shopping_cart);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),  // Hamburger icon
              onPressed: () {
                Scaffold.of(context).openDrawer();  // Open the drawer when the hamburger icon is pressed
              },
            );
          },
        ),
        title: const Text(
            'Home',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold)
        ),
        centerTitle: true,
        actions: [
          // Show different actions based on the selected tab
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {},
          ),
        ],
      ),

      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              children: const [
                ProductListScreen(),
                CustomerPage(),
              ],
            ),
          ),
      ]
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          _pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Product List',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Customers',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Map',
          ),
        ],
      ),
    );
  }
}