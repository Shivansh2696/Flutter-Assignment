import 'package:flutter/material.dart';

import 'circularCardList.dart';
import 'jwelleryCardlist.dart';

class ProductListScreen extends StatefulWidget{
  const ProductListScreen({super.key});

  @override
  _productListScreen createState() => _productListScreen();
}

class _productListScreen extends State<ProductListScreen>{

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
  Widget build(BuildContext context) {
    return Column(
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
          child: JewelryCardList(jewelryList: jewelryList),
        ),
      ],
    );
  }
}