import 'package:flutter/material.dart';
import '../models/donation.dart';
import '../screens/donation/donation_detail_screen.dart';
import '../core/constants/app_colors.dart';

class DonationCard extends StatelessWidget {
  final Donation donation;

  const DonationCard({super.key, required this.donation});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Card(
        color: AppColors.card,
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: ListTile(
          leading: const CircleAvatar(
            backgroundColor: AppColors.primary,
            child: Icon(Icons.volunteer_activism, color: Colors.white),
          ),
          title: Text(
            donation.title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          subtitle: Text('Quantity: ${donation.quantity}'),
          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => DonationDetailScreen(donation: donation),
              ),
            );
          },
        ),
      ),
    );
  }
}
