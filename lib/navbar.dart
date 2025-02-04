import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class FancyNavBar extends StatefulWidget {
  const FancyNavBar({super.key});

  @override
  _FancyNavBarState createState() => _FancyNavBarState();
}

class _FancyNavBarState extends State<FancyNavBar> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    Center(child: Text("🏠 Home", style: TextStyle(fontSize: 24))),
    Center(child: Text("📁 Files", style: TextStyle(fontSize: 24))),
    Center(child: Text("🔔 Notifications", style: TextStyle(fontSize: 24))),
    Center(child: Text("⚙️ Settings", style: TextStyle(fontSize: 24))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: _pages[_selectedIndex],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.grey[200]!,
        color: Colors.blueAccent,
        buttonBackgroundColor: Colors.white,
        animationDuration: Duration(milliseconds: 300),
        items: [
          Icon(Icons.home, size: 30, color: Colors.black),
          Icon(Icons.folder, size: 30, color: Colors.black),
          Icon(Icons.notifications, size: 30, color: Colors.black),
          Icon(Icons.settings, size: 30, color: Colors.black),
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
