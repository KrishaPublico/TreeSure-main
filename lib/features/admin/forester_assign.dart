import 'package:flutter/material.dart';
import 'forester_tagging_form.dart'; // 👈 Make sure this file is in the same folder or update the path accordingly


class ForesterAssignmentPage extends StatefulWidget {
  final String type;

  const ForesterAssignmentPage({Key? key, required this.type}) : super(key: key);

  @override
  _ForesterAssignmentPageState createState() => _ForesterAssignmentPageState();
}

class _ForesterAssignmentPageState extends State<ForesterAssignmentPage> {
  List<String> foresters = [];
  Map<String, bool> selectedForesters = {};

  @override
  void initState() {
    super.initState();
    // Forester A to I
    foresters = List.generate(9, (index) => 'Forester ${String.fromCharCode(65 + index)}');
    selectedForesters = {for (var forester in foresters) forester: false};
  }

  void assignSelected() {
    final assigned = selectedForesters.entries
        .where((entry) => entry.value)
        .map((entry) => entry.key)
        .toList();

    if (assigned.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please select at least one forester.')),
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ForesterTaggingFormPage(selectedForesters: assigned),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[700],
        title: const Text(
          'Assign Forester',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: foresters.map((forester) {
                return CheckboxListTile(
                  title: Text(forester),
                  value: selectedForesters[forester],
                  onChanged: (bool? value) {
                    setState(() {
                      selectedForesters[forester] = value ?? false;
                    });
                  },
                );
              }).toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: assignSelected,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[700],
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text(
                  'Assign Selected Forester(s)',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
