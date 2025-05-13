import 'package:flutter/material.dart';
import 'package:treesure_app/features/login/login_page.dart';
import 'package:treesure_app/features/intro/intro_page.dart'; // Make sure this import path is correct

class RolePage extends StatelessWidget {
  const RolePage({super.key});

  @override
  Widget build(BuildContext context) {
    final double buttonWidth = 180;

    final ButtonStyle commonButtonStyle = ElevatedButton.styleFrom(
      backgroundColor: Colors.green[800],
      foregroundColor: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      textStyle: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/treesure_logo.png",
              height: MediaQuery.of(context).size.width * 0.50,
            ),
            const Text(
              "TreeSure",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 23, 91, 25),
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Choose your role to continue:",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 30),

            // Admin Button
            SizedBox(
              width: buttonWidth,
              child: ElevatedButton(
                style: commonButtonStyle,
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage(role: "admin")),
                  );
                },
                child: const Text("Admin"),
              ),
            ),
            const SizedBox(height: 10),

            // Forester Button
            SizedBox(
              width: buttonWidth,
              child: ElevatedButton(
                style: commonButtonStyle,
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage(role: "forester")),
                  );
                },
                child: const Text("Forester"),
              ),
            ),
            const SizedBox(height: 10),

            // Applicant Button
            SizedBox(
              width: buttonWidth,
              child: ElevatedButton(
                style: commonButtonStyle,
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage(role: "applicant")),
                  );
                },
                child: const Text("Applicant"),
              ),
            ),
            const SizedBox(height: 10),

            // Logout Button
            SizedBox(
              width: buttonWidth,
              child: ElevatedButton(
                style: commonButtonStyle,
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const IntroPage()),
                  );
                },
                child: const Text("Logout"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
