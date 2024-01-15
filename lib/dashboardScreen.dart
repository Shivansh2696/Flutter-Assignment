
import 'package:flutter/material.dart';
import 'package:flutter_assignment/jwelleryCardlist.dart';

import 'circularCardList.dart';

class DashboardScreen extends StatefulWidget{
  const DashboardScreen({super.key});

  @override
  _dashboardScreen createState() => _dashboardScreen();
}

class _dashboardScreen extends State<DashboardScreen>{
  int _currentIndex = 0;
  final PageController _pageController = PageController();
  bool _isCustomersPage = false;

  final List<Jewelry> jewelryList = [
    Jewelry(imageUrl: 'https://staticimg.titan.co.in/Tanishq/Catalog/512218FDHAA00_1.jpg?impolicy=pqmed', name: 'Devotional Gold Ring for Men', weight: 7.629, price: 5565456),
    Jewelry(imageUrl: 'https://staticimg.titan.co.in/Tanishq/Catalog/500109SDAABAPL_1.jpg?impolicy=pqmed', name: 'Devotional Gold Ring for Men', weight: 7.629, price: 5565456),
    Jewelry(imageUrl: 'https://staticimg.titan.co.in/Tanishq/Catalog/511156PRVAAA00_1.jpg?impolicy=pqmed', name: 'Devotional Gold Ring for Men', weight: 7.629, price: 5565456),
    Jewelry(imageUrl: 'https://staticimg.titan.co.in/Tanishq/Catalog/511250YHZAA00_1.jpg?impolicy=pqmed', name: 'Devotional Gold Ring for Men', weight: 7.629, price: 5565456),
    Jewelry(imageUrl: 'https://staticimg.titan.co.in/Tanishq/Catalog/513017CQKAA00_1.jpg?impolicy=pqmed', name: 'Devotional Gold Ring for Men', weight: 7.629, price: 5565456),
    Jewelry(imageUrl: 'https://staticimg.titan.co.in/Tanishq/Catalog/502614OCBAAA02_1.jpg?impolicy=pqmed', name: 'Devotional Gold Ring for Men', weight: 7.629, price: 5565456),
    Jewelry(imageUrl: 'https://staticimg.titan.co.in/Tanishq/Catalog/5138172DWABA00_1.jpg?impolicy=pqmed', name: 'Devotional Gold Ring for Men', weight: 7.629, price: 5565456),
    Jewelry(imageUrl: 'https://staticimg.titan.co.in/Tanishq/Catalog/5137192AO1BA00_1.jpg?impolicy=pqmed', name: 'Devotional Gold Ring for Men', weight: 7.629, price: 5565456),
    Jewelry(imageUrl: 'https://staticimg.titan.co.in/Tanishq/Catalog/5137192BA1BA00_1.jpg?impolicy=pqmed', name: 'Devotional Gold Ring for Men', weight: 7.629, price: 5565456),
    Jewelry(imageUrl: 'https://staticimg.titan.co.in/Tanishq/Catalog/5137192CI1BAP1_1.jpg?impolicy=pqmed', name: 'Devotional Gold Ring for Men', weight: 7.629, price: 5565456),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

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
          // Add your icon on the end here
          IconButton(
            icon: const Icon(Icons.shopping_cart),  // Placeholder icon (replace with your desired icon)
            onPressed: () {
              // Add the functionality for the icon here
            },
          ),
        ],
      ),

      body: Column(
        children: [
          SizedBox(
            height: 120,
            child: CircularCardList(
              cardDataList: [
                CircularCardData(icon: Icons.menu, text: 'All Cat'),
                CircularCardData(icon: Icons.local_offer_outlined, text: 'Offers'),
                CircularCardData(icon: Icons.local_grocery_store_outlined, text: 'Grocery'),
                CircularCardData(icon: Icons.phone_android_outlined, text: 'Mobiles'),
                CircularCardData(icon: Icons.shopping_bag_outlined, text: 'Fashion'),
              ],
            ),
          ),
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                  _isCustomersPage = index == 1; // Assuming "Customers" tab is at index 1
                });
              },
              children: [
                // Your Product List page (index 0)
                JewelryCardList(jewelryList: jewelryList),
                // Your Customers page (index 1)
                // Add your Customers page widget here
                // Your Map page (index 2)
                // Add your Map page widget here
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