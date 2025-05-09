import 'package:flutter/material.dart';

import '../navbars/applicant_navbar.dart';

class AdminHomepage extends StatelessWidget {
  const AdminHomepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const ApplicantNavbar(),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            // Header Stack with QR
            Stack(
              clipBehavior: Clip.none,
              children: [
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
                        Image.asset("assets/treesure_leaf.png", height: 50),
                        const SizedBox(height: 10),
                        const CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.white,
                          child:
                              Icon(Icons.person, size: 40, color: Colors.green),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "Lyca Amblan Batislaon",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const Text(
                          "Admin",
                          style: TextStyle(fontSize: 14, color: Colors.white70),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
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

            const SizedBox(height: 60),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                children: [
                  _buildPermitButton(
                    context,
                    "CTPO (Certificate of Tree Plantation Ownership)",
                    Icons.description,
                    () {
                      // TODO: Navigate to CTPO page
                    },
                  ),
                  const SizedBox(height: 15),
                  _buildPermitButton(
                    context,
                    "Cutting Permit",
                    Icons.content_cut,
                    () {
                      // TODO: Navigate to Cutting Permit page
                    },
                  ),
                  const SizedBox(height: 15),
                  _buildPermitButton(
                    context,
                    "Certificate to Travel (COV)",
                    Icons.directions_bus,
                    () {
                      // TODO: Navigate to COV page
                    },
                  ),
                  const SizedBox(height: 15),
                  _buildPermitButton(
                    context,
                    "Chainsaw Permit",
                    Icons.build,
                    () {
                      // TODO: Navigate to Chainsaw Permit page
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildPermitButton(BuildContext context, String title, IconData icon,
      VoidCallback onPressed) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green.shade800,
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.white),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
