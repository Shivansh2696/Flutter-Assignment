import 'package:flutter/material.dart';

class CircularCardList extends StatelessWidget {
  final List<CircularCardData> cardDataList;

  const CircularCardList({Key? key, required this.cardDataList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: cardDataList.length,
      itemBuilder: (context, index) {
        return CircularCard(
          icon: cardDataList[index].icon,
          text: cardDataList[index].text,
        );
      },
    );
  }
}

class CircularCard extends StatelessWidget {
  final IconData icon;
  final String text;

  const CircularCard({Key? key, required this.icon, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: const Color(0xFFB8EDC2),
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 25,
            color: Colors.black54,
          ),
          const SizedBox(height: 8.0),
          Text(
            text,
            style: const TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}

class CircularCardData {
  final IconData icon;
  final String text;

  CircularCardData({required this.icon, required this.text});
}
