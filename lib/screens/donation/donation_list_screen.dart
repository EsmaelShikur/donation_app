import 'package:flutter/material.dart';
import '../../services/donation_service.dart';
import '../../widgets/donation_card.dart';
import 'create_donation_screen.dart';
import '../../services/auth_service.dart';
import '../../models/user_role.dart';

class DonationListScreen extends StatefulWidget {
  const DonationListScreen({super.key});

  @override
  State<DonationListScreen> createState() => _DonationListScreenState();
}

class _DonationListScreenState extends State<DonationListScreen> {
  @override
  Widget build(BuildContext context) {
    final donations = DonationService.donations;

    return Scaffold(
      appBar: AppBar(title: const Text('Donations')),
      floatingActionButton: AuthService.currentRole == UserRole.donor
          ? FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const CreateDonationScreen(),
                  ),
                );
                setState(() {});
              },
            )
          : null,

      body: ListView.builder(
        itemCount: donations.length,
        itemBuilder: (context, index) {
          return DonationCard(donation: donations[index]);
        },
      ),
    );
  }
}
