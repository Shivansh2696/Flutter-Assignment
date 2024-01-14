
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget{
  const DashboardScreen({super.key});

  @override
  _dashboardScreen createState() => _dashboardScreen();
}

class _dashboardScreen extends State<DashboardScreen>{
  int _currentIndex = 0;

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
      body: const Center(
        child: Text("Welcome to the Dashboard!"),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          // Update the selected tab when a tab is tapped
          setState(() {
            _currentIndex = index;
          });
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