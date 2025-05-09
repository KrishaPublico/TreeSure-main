import 'package:flutter/material.dart';

import 'home_widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),

            // Stack for Header with QR Code
            Stack(
              clipBehavior: Clip.none,
              children: [
                // Green Container
                Container(
                  width: 350,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        Image.asset("assets/treesure_leaf.png",
                            height: 50), // Updated Image
                        const SizedBox(height: 10),
                        const CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.white,
                          child:
                              Icon(Icons.person, size: 40, color: Colors.green),
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
                        const SizedBox(height: 20), // Extra spacing for QR code
                      ],
                    ),
                  ),
                ),

                // QR Code positioned on top
                Positioned(
                  bottom: -25, // Adjusted position to overlap
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(4.0),
                        child: CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.white,
                          child: Icon(Icons.qr_code,
                              size: 30, color: Colors.green),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 40), // Adjusted spacing after QR code

            // Tree Cutting Request Section
            const Text(
              "Tree Cutting Request",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 90,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green.shade800,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          minimumSize: const Size(double.infinity, 70),
                        ),
                        child: const Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.home, color: Colors.white, size: 30),
                            SizedBox(height: 5),
                            Text(
                              "Gov't Agency\nRepresentative",
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: SizedBox(
                      height: 90,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green.shade800,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          minimumSize: const Size(double.infinity, 70),
                        ),
                        child: const Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.person,
                                color: Colors.white, size: 30), // Icon on top
                            SizedBox(height: 5), // Spacing
                            Text(
                              "Private Applicant",
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // What trees are not allowed to cut? Section
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
            const SizedBox(height: 10),
            buildTreeRestrictionCard(
              "Trees marked by the DENR as Significant or Important",
            ),
            buildTreeRestrictionCard(
              "Century-old trees, even if not officially tagged",
            ),
            buildTreeRestrictionCard(
              "Trees that add beauty to public areas",
            ),
          ],
        ),
      ),
    );
  }
}
