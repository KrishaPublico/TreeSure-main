import 'package:flutter/material.dart';

class RegisterTreesPage extends StatefulWidget {
  const RegisterTreesPage({super.key});

  @override
  State<RegisterTreesPage> createState() => _RegisterTreesPageState();
}

class _RegisterTreesPageState extends State<RegisterTreesPage> {
  final TextEditingController treeNoController = TextEditingController();
  final TextEditingController specieController = TextEditingController();
  final TextEditingController diameterController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController gpsLocationController = TextEditingController();
  final TextEditingController volumeController = TextEditingController();
  final TextEditingController qrTagController = TextEditingController();
  final TextEditingController photoEvidenceController = TextEditingController();

  @override
  void dispose() {
    treeNoController.dispose();
    specieController.dispose();
    diameterController.dispose();
    heightController.dispose();
    gpsLocationController.dispose();
    volumeController.dispose();
    qrTagController.dispose();
    photoEvidenceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tree Inventory"),
        backgroundColor: Colors.green[800],
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            buildTextField("Tree No.", treeNoController),
            buildTextField("Specie", specieController),
            buildTextField("Diameter (cm)", diameterController),
            buildTextField("Height (m)", heightController),
            buildTextField("GPS Location", gpsLocationController),
            buildTextField("Volume (CU, m)", volumeController),
            buildTextField("QR Tagging", qrTagController),
            buildTextField("Photo Evidence", photoEvidenceController),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add submission logic here
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[800],
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text("Submit", style: TextStyle(fontSize: 16, color:Colors.white)),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}