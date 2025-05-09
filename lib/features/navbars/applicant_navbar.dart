import 'package:flutter/material.dart';
import 'package:treesure_app/features/history/history_page.dart';
import 'package:treesure_app/features/home/home_page.dart';
import 'package:treesure_app/features/notification/notif_page.dart';
import 'package:treesure_app/features/profile/profile_page.dart';

class ApplicantNavbar extends StatefulWidget {
  const ApplicantNavbar({super.key});

  @override
  ApplicantNavbarState createState() => ApplicantNavbarState();
}

class ApplicantNavbarState extends State<ApplicantNavbar> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const HistoryPage(),
    const NotifPage(),
    const ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green, // Optional: Matches your theme
      body: IndexedStack( // Keeps page states alive
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // Ensures labels always show
        backgroundColor: Colors.grey[900],
        selectedItemColor: Colors.green[900],
        unselectedItemColor: Colors.green,
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: "History"),
          BottomNavigationBarItem(icon: Icon(Icons.local_florist), label: "Notif"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Settings"),
        ],
      ),
    );
  }
}
