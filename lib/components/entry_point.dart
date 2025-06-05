import 'package:flutter/material.dart';
import 'package:instant_extract/screens/dashboard_screen.dart';

class EntryPoint extends StatefulWidget {
  const EntryPoint({super.key});

  @override
  State<EntryPoint> createState() => _EntryPointState();
}

class _EntryPointState extends State<EntryPoint> {
  int _selectedIndex = 0;

  final List<Widget> screens = [
    const DashboardScreen(),
    const Center(child: Text('Document Screen')),
    const Center(child: Text('App Screen')),
    const Center(child: Text('User Screen')),
  ];

  void onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white60,
        currentIndex: _selectedIndex,
        onTap: onTap,
        type: BottomNavigationBarType.fixed, // make sure to set this if using 4+ items
        items: [
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/home.png', color: Colors.white, width: 30, height: 30),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/document.png', color: Colors.white, width: 30, height: 30),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/app.png', color: Colors.white, width: 30, height: 30),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/user.png', color: Colors.white, width: 30, height: 30),
            label: '',
          ),
        ],
      ),
    );
  }
}
