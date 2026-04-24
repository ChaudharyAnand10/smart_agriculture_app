import 'package:flutter/material.dart';
import '../market_model.dart';

class MarketCard extends StatelessWidget {
  final MarketModel data;

  const MarketCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      child: ListTile(
        title: Text(
          data.commodity,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text("${data.market}, ${data.district}"),
        trailing: Text(
          "₹${data.price}",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.green,
          ),
        ),
      ),
    );
  }
}