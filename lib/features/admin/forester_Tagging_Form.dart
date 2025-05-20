import 'package:flutter/material.dart';

class ForesterTaggingFormPage extends StatefulWidget {
  final List<String> selectedForesters;

  const ForesterTaggingFormPage({Key? key, required this.selectedForesters}) : super(key: key);

  @override
  _ForesterTaggingFormPageState createState() => _ForesterTaggingFormPageState();
}

class _ForesterTaggingFormPageState extends State<ForesterTaggingFormPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();

  void handleSubmit() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Foresters Assigned:\n${widget.selectedForesters.join(', ')}\nDate: ${_dateController.text}\nLocation: ${_locationController.text}",
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Field Tagging Details',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green[700],
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Text(
                'Selected Foresters:\n${widget.selectedForesters.join(', ')}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.green[900], // dark green text color
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _dateController,
                decoration: const InputDecoration(
                  labelText: 'Date',
                  border: OutlineInputBorder(),
                ),
                validator: (value) => value == null || value.isEmpty ? 'Please enter a date' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _locationController,
                decoration: const InputDecoration(
                  labelText: 'Location',
                  border: OutlineInputBorder(),
                ),
                validator: (value) => value == null || value.isEmpty ? 'Please enter a location' : null,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: handleSubmit,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[700],
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text('Confirm Assignment'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
