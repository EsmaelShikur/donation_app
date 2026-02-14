import 'package:flutter/material.dart';
import '../../models/donation.dart';
import '../../core/utils/validators.dart';

class EditDonationScreen extends StatefulWidget {
  final Donation donation;

  const EditDonationScreen({super.key, required this.donation});

  @override
  State<EditDonationScreen> createState() => _EditDonationScreenState();
}

class _EditDonationScreenState extends State<EditDonationScreen> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  late TextEditingController _quantityController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.donation.title);
    _descriptionController = TextEditingController(
      text: widget.donation.description,
    );
    _quantityController = TextEditingController(text: widget.donation.quantity);
  }

  void _saveChanges() {
    if (_formKey.currentState!.validate()) {
      widget.donation.title = _titleController.text;
      widget.donation.description = _descriptionController.text;
      widget.donation.quantity = _quantityController.text;

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Donation')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _titleController,
                validator: Validators.notEmpty,
                decoration: const InputDecoration(labelText: 'Title'),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _descriptionController,
                validator: Validators.notEmpty,
                decoration: const InputDecoration(labelText: 'Description'),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _quantityController,
                validator: Validators.notEmpty,
                decoration: const InputDecoration(labelText: 'Quantity'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveChanges,
                child: const Text('Save Changes'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
