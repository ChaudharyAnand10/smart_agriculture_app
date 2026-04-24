import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselWidget extends StatelessWidget {
  CarouselWidget({super.key});

  final List<String> images = [
    "https://picsum.photos/400?1",
    "https://picsum.photos/400?2",
    "https://picsum.photos/400?3",
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 180,
        autoPlay: true,
        enlargeCenterPage: true,
      ),
      items: images.map((url) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(url, fit: BoxFit.cover, width: double.infinity),
        );
      }).toList(),
    );
  }
}