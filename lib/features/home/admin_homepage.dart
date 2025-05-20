import 'package:flutter/material.dart';
import 'package:treesure_app/features/admin/ctpo.dart';
import 'package:treesure_app/features/admin/CuttingPermit.dart';

class AdminHomepage extends StatelessWidget {
  const AdminHomepage({super.key});

  final int totalUsers = 42; // Dummy data
  final int totalTrees = 123; // Dummy data

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),

            // Header with profile
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.all(12.0),
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
                        "Lyca Ambalan Batislaon",
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

            const SizedBox(height: 60),

            // Total Users & Total Trees buttons side-by-side
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 70,
                      child: ElevatedButton.icon(
                        icon: const Icon(Icons.group, size: 30, color: Colors.white),
                        label: Text(
                          'Users\n$totalUsers',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Total Users: $totalUsers')),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 52, 123, 57),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: SizedBox(
                      height: 70,
                      child: ElevatedButton.icon(
                        icon: const Icon(Icons.park, size: 30, color: Colors.white),
                        label: Text(
                          'Trees\n$totalTrees',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Total Trees: $totalTrees')),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 52, 123, 57),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20), // Reduced spacing

            // Permit buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                children: [
                  _buildPermitButton(
                    context,
                    "Manage Users",
                    Icons.person_add,
                    () {},
                  ),
                  const SizedBox(height: 15),
                  _buildPermitButton(
                    context,
                    "CTPO (Certificate of Tree Plantation Ownership)",
                    Icons.description,
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CTPOUploadPage()),
                      );
                    },
                  ),
                  const SizedBox(height: 15),
                  _buildPermitButton(
                    context,
                    "Cutting Permit",
                    Icons.content_cut,
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CuttingPermitPage()),
                      );
                    },
                  ),
                  const SizedBox(height: 15),
                  _buildPermitButton(
                    context,
                    "Certificate to Travel (COV)",
                    Icons.directions_bus,
                    () {},
                  ),
                  const SizedBox(height: 15),
                  _buildPermitButton(
                    context,
                    "Chainsaw Permit",
                    Icons.build,
                    () {},
                  ),
                  const SizedBox(height: 15),
                  _buildPermitButton(
                    context,
                    "Reports",
                    Icons.bar_chart,
                    () {},
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

  Widget _buildPermitButton(
    BuildContext context,
    String title,
    IconData icon,
    VoidCallback onPressed,
  ) {
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
            if (title == "Non Timber" || title == "Tenurial Instrument")
              const Icon(Icons.arrow_drop_down, color: Colors.white),
          ],
        ),
      ),
    );
  }
}
