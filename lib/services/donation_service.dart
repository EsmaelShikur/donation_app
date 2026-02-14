import '../models/donation.dart';

class DonationService {
  static List<Donation> donations = [
    Donation(
      title: 'Food Donation',
      description: 'Rice and bread',
      quantity: '20 plates',
    ),
  ];

  static void addDonation(Donation donation) {
    donations.add(donation);
  }

  static void deleteDonation(Donation donation) {
    donations.remove(donation);
  }
}
