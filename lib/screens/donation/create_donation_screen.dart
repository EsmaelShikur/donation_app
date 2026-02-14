import 'package:flutter/material.dart';
import '../../core/utils/validators.dart';
import '../../models/donation.dart';
import '../../services/donation_service.dart';

class CreateDonationScreen extends StatefulWidget {
  const CreateDonationScreen({super.key});

  @override
  State<CreateDonationScreen> createState() => _CreateDonationScreenState();
}

class _CreateDonationScreenState extends State<CreateDonationScreen> {
  final _formKey = GlobalKey<FormState>();

  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _quantityController = TextEditingController();

  void _submitDonation() {
    if (_formKey.currentState!.validate()) {
      DonationService.addDonation(
        Donation(
          title: _titleController.text,
          description: _descriptionController.text,
          quantity: _quantityController.text,
        ),
      );

      Navigator.pop(context); // Go back to list
    }
  }

  InputDecoration _inputDecoration(String label, IconData icon) {
    return InputDecoration(
      labelText: label,
      prefixIcon: Icon(icon),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create Donation')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: _inputDecoration('Donation Title', Icons.title),
                validator: Validators.notEmpty,
              ),

              const SizedBox(height: 16),

              TextFormField(
                controller: _descriptionController,
                decoration: _inputDecoration('Description', Icons.description),
                validator: Validators.notEmpty,
                maxLines: 3,
              ),

              const SizedBox(height: 16),

              TextFormField(
                controller: _quantityController,
                decoration: _inputDecoration('Quantity', Icons.numbers),
                validator: Validators.notEmpty,
              ),
              SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _submitDonation,
                  child: const Text('Submit Donation'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
