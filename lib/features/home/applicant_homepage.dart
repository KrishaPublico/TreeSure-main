import 'package:flutter/material.dart';
import 'home_widgets.dart';

class ApplicantHomepage extends StatelessWidget {
  const ApplicantHomepage({super.key});

  final int totalRestrictedTrees = 30;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: 350,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    children: [
                      Image.asset("assets/treesure_leaf.png", height: 50),
                      const SizedBox(height: 10),
                      const CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.white,
                        child: Icon(Icons.person, size: 40, color: Colors.green),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "Krisha Arellano Publico",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const Text(
                        "Applicant",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white70,
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
                Positioned(
                  bottom: -25,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      padding: const EdgeInsets.all(4.0),
                      child: const CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.white,
                        child: Icon(Icons.qr_code, size: 30, color: Colors.green),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30), // Adjusted from 40 to 30 for less spacing

            // Total Trees Button
            SizedBox(
              width: 250,
              height: 60,
              child: ElevatedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Total Restricted Trees: $totalRestrictedTrees'),
                    ),
                  );
                },
                icon: const Icon(
                  Icons.park_rounded,
                  size: 36,
                  color: Colors.white,
                ),
                label: Text(
                  'Total Trees: $totalRestrictedTrees',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor:  const Color.fromARGB(255, 52, 123, 57),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "What trees are not allowed to cut?",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.green.shade800,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),

            buildTreeRestrictionCard(
              "Trees marked by the DENR as Significant or Important",
              "assets/pic1.jpg",
            ),
            buildTreeRestrictionCard(
              "Century-old trees, even if not officially tagged",
              "assets/pic2.jpg",
            ),
            buildTreeRestrictionCard(
              "Trees that add beauty to public areas",
              "assets/pic3.JPG",
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget buildTreeRestrictionCard(String text, String imagePath) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 10,
                    offset: const Offset(3, 3),
                  ),
                ],
              ),
              clipBehavior: Clip.hardEdge,
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
