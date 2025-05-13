import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class PermitToCutPage extends StatefulWidget {
  const PermitToCutPage({Key? key}) : super(key: key);

  @override
  _PermitToCutPageState createState() => _PermitToCutPageState();
}

class _PermitToCutPageState extends State<PermitToCutPage> {
  final Map<String, String?> uploadedFiles = {
    "1. Letter request to be addressed to:\n   FORESTER JOSELITO D. RAZON\n   CENR Officer\n   DENR-CENRO APARRI\n   Punta, Aparri, Cagayan": null,
    "2. Barangay Certification interposing no objection on the cutting of trees.": null,
    "3. Certified copy of Title/Electronic Copy of Title.": null,
    "4. Special Power of Attorney (SPA) / Deed of Sale from the owner of the Land Title (If the applicant is not the owner of the Titled lot)": null,
  };

  Future<void> pickFile(String label) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null && result.files.single.path != null) {
      setState(() {
        uploadedFiles[label] = result.files.single.name;
      });
    }
  }

  void handleSubmit() {
    final incomplete = uploadedFiles.entries.where((e) => e.value == null);
    if (incomplete.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please upload all required files before submitting.'),
          backgroundColor: Colors.red,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Form submitted successfully!'),
          backgroundColor: Colors.green[700],
        ),
      );
    }
  }

  Widget buildUploadField(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  label,
                  style: TextStyle(fontSize: 16),
                ),
              ),
              ElevatedButton(
                onPressed: () => pickFile(label),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[700],
                  foregroundColor: Colors.white,
                ),
                child: Text("Upload File"),
              ),
            ],
          ),
          if (uploadedFiles[label] != null)
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(
                'Selected: ${uploadedFiles[label]}',
                style: TextStyle(fontSize: 13, color: Colors.green[700]),
              ),
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Issuance of Tree Cutting Permit'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'ISSUANCE OF TREE CUTTING PERMIT WITHIN TITLED LOT/PRIVATE LOT',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              'REQUIREMENTS:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            // Upload fields
            for (String label in uploadedFiles.keys) buildUploadField(label),

            const SizedBox(height: 24),

            // Italicized seedling note
            Text(
              'Seedling Replacement as per DENR Memorandum No. 2012 02 (one (1) Tree = 50 indigenous seedlings)',
              style: TextStyle(
                fontSize: 16,
                fontStyle: FontStyle.italic,
              ),
            ),

            const SizedBox(height: 32),

            // Submit Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: handleSubmit,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[700],
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'Submit',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Ensure white text
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
