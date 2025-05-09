import 'package:flutter/material.dart';
import '../roles/roles_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo image
            Image.asset('assets/treesure_logo.png'),

            const SizedBox(height: 50),

            // Logo title text
            Text(
              'TreeSure',
              style: TextStyle(
                fontSize: 42,
                fontWeight: FontWeight.bold,
                color: Colors.green[900],
                fontFamily: 'Poppins', 
              ),
            ),

            const SizedBox(height: 30),

            // Get Started button
            GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const RolePage(),
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  width: 300,
                  decoration: BoxDecoration(color: Colors.green[900]),
                  child: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Center(
                      child: Text(
                        'Get Started',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 23,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
