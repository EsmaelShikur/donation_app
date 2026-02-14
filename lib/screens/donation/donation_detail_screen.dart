import 'package:flutter/material.dart';
import '../../models/donation.dart';
import '../../services/donation_service.dart';
import 'edit_donation_screen.dart';

class DonationDetailScreen extends StatelessWidget {
  final Donation donation;

  const DonationDetailScreen({super.key, required this.donation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Donation Details'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => EditDonationScreen(donation: donation),
                ),
              );
              // ignore: use_build_context_synchronously
              Navigator.pop(context);
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              DonationService.deleteDonation(donation);
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(donation.description),
      ),
    );
  }
}
