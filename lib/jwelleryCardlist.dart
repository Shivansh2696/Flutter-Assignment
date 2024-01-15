import 'package:flutter/material.dart';

class JewelryCardList extends StatelessWidget {
  final List<Jewelry> jewelryList;

  const JewelryCardList({Key? key, required this.jewelryList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
      itemCount: jewelryList.length,
      itemBuilder: (context, index) {
        return JewelryCard(jewelry: jewelryList[index]);
      },
    );
  }
}

class JewelryCard extends StatelessWidget {
  final Jewelry jewelry;

  const JewelryCard({Key? key, required this.jewelry}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 110,
            height: 110,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
            ),
            child: Image.network(
              jewelry.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      jewelry.name,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    const SizedBox(height: 2.0),
                    Text(
                      'Weight: ${jewelry.weight} g',
                      style: const TextStyle(
                        fontSize: 11,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 2.0),
                    Text(
                      'Price: \$${jewelry.price}',
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}




class Jewelry {
  final String imageUrl;
  final String name;
  final double weight;
  final double price;

  Jewelry({
    required this.imageUrl,
    required this.name,
    required this.weight,
    required this.price,
  });
}
