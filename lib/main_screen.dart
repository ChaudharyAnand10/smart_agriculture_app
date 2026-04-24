import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../features/home/home_screen.dart';
import '../features/crops/crop_screen.dart';
import '../features/disease/disease_screen.dart';
import '../features/chat/chat_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;

  final List<Widget> pages = [
    HomeScreen(),
    CropScreen(),
    DiseaseScreen(),
    ChatScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },




         type: BottomNavigationBarType.fixed, // 🔥 IMPORTANT

  selectedItemColor: Colors.green,
  unselectedItemColor: Colors.black,

  selectedLabelStyle: const TextStyle(
    color: Colors.green,
    fontWeight: FontWeight.bold,
  ),

  unselectedLabelStyle: const TextStyle(
    color: Colors.black,
  ),

  showUnselectedLabels: true,
       








        
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.grass), label: "Crops"),
          BottomNavigationBarItem(icon: Icon(Icons.bug_report), label: "Disease"),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chat"),
        ],
      ),
    );
  }
}