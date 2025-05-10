import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

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

  File? imageFile;
  final ImagePicker _picker = ImagePicker();

  @override
  void dispose() {
    treeNoController.dispose();
    specieController.dispose();
    diameterController.dispose();
    heightController.dispose();
    gpsLocationController.dispose();
    volumeController.dispose();
    super.dispose();
  }

  Future<void> pickImage() async {
    try {
      final XFile? picked = await _picker.pickImage(source: ImageSource.gallery);
      if (picked != null) {
        setState(() {
          imageFile = File(picked.path);
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to pick image: $e")),
      );
    }
  }

  void generateQrTag() {
    // Implement QR code generation logic here
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("QR Code generated based on tree details")),
    );
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
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: generateQrTag,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[700],
              ),
              child: const Text("Generate QR Tag", style: TextStyle(color: Colors.white)),
            ),
            const SizedBox(height: 20),
            const Text("Photo Evidence", style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            imageFile != null
                ? Image.file(imageFile!, height: 200)
                : const Text("No image selected."),
            TextButton.icon(
              icon: const Icon(Icons.upload),
              label: const Text("Upload Photo"),
              onPressed: pickImage,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle form submission here
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[800],
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text("Submit", style: TextStyle(fontSize: 16, color: Colors.white)),
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
