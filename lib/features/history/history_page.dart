import 'package:flutter/material.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  HistoryPageState createState() => HistoryPageState();
}

class HistoryPageState extends State<HistoryPage> {
  final List<String> categories = [
    "All",
    "Scheduled",
    "Pending",
    "Incomplete",
    "Completed",
    "Overdue"
  ];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "History",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(width: 5),
            Icon(Icons.eco, color: Colors.green, size: 24),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            // Search Bar
            Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.green[100],
                borderRadius: BorderRadius.circular(20),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: "Search",
                  border: InputBorder.none,
                  icon: Icon(Icons.search, color: Colors.black45),
                ),
              ),
            ),

            // Category Filter
            // Category Filter
            Wrap(
              alignment: WrapAlignment.center, // Aligns items in center
              spacing: 8, // Horizontal spacing between items
              runSpacing: 8, // Vertical spacing between rows when wrapping
              children: List.generate(categories.length, (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: selectedIndex == index
                            ? Colors.green
                            : Colors.black45,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      categories[index],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: selectedIndex == index
                            ? Colors.green
                            : Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              }),
            ),

            const SizedBox(height: 40),

            // No Records Found Message
            const Center(
              child: Text(
                "No Records Found",
                style: TextStyle(fontSize: 18, color: Colors.black54),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
