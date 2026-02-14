import 'package:flutter/material.dart';
import '../donation/donation_list_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: ElevatedButton(
          child: const Text('View Donations'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const DonationListScreen()),
            );
          },
        ),
      ),
    );
  }
}
