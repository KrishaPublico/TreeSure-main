import 'package:flutter/material.dart';
import 'forester_assign.dart'; // Make sure this path is correct

class CTPOUploadPage extends StatefulWidget {
  @override
  _CTPOUploadPageState createState() => _CTPOUploadPageState();
}

class _CTPOUploadPageState extends State<CTPOUploadPage> {
  final Map<String, String?> uploadedFiles = {
    "1. Letter of Application (1 original, 1 photocopy)": null,
    "2. OCT, TCT, Judicial Title, CLOA, Tax Declared Alienable and Disposable Lands (1 certified true copy)": null,
    "3. Data on the number of seedlings planted, species and area planted": null,
    "4. Endorsement from concerned LGU interposing no objection to the cutting of tree under the following conditions (1 original)": null,
    "4.a If the trees to be cut falls within one barangay, an endorsement from the Barangay Captain shall be secured": null,
    "4.b If the trees to be cut falls within more than one barangay, endorsement shall be secured either from the Municipal/City Mayor or all the Barangay Captains concerned": null,
    "4.c If the trees to be cut fall within more than one municipality/city, endorsement shall be secured either from the Provincial Governor or all the Municipality/City Mayors concerned": null,
    "5. Special Power of Attorney (SPA) (1 original) – [Applicable if the client is a representative]": null,
  };

  Widget buildUploadField(String label) {
    final isIndented = label.startsWith("4.a") || label.startsWith("4.b") || label.startsWith("4.c");
    final noUpload = label == "4. Endorsement from concerned LGU interposing no objection to the cutting of tree under the following conditions (1 original)";

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: isIndented ? 24.0 : 0),
              child: Text(
                label,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
            ),
          ),
          if (!noUpload)
            ElevatedButton(
              onPressed: () {
                // Placeholder for file picker
                setState(() {
                  uploadedFiles[label] = "dummy_file.pdf";
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
              ),
              child: Text("Upload File"),
            ),
        ],
      ),
    );
  }

  void handleSubmit() {
    // Determine endorsement level for forester assignment
    String type = "barangay"; // default
    if (uploadedFiles["4.c If the trees to be cut fall within more than one municipality/city, endorsement shall be secured either from the Provincial Governor or all the Municipality/City Mayors concerned"] != null) {
      type = "province";
    } else if (uploadedFiles["4.b If the trees to be cut falls within more than one barangay, endorsement shall be secured either from the Municipal/City Mayor or all the Barangay Captains concerned"] != null) {
      type = "municipality";
    }

    // Navigate to the Forester Assignment page
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ForesterAssignmentPage(type: type),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[700],
        iconTheme: IconThemeData(color: Colors.white),
        title: Text('CTPO File Upload', style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Upload Documents for Certificate of Tree Plantation Ownership (CTPO)',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            for (String label in uploadedFiles.keys) buildUploadField(label),
            const SizedBox(height: 32),
            Center(
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: handleSubmit,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green[700],
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 20),
                    textStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text('Submit'),
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
