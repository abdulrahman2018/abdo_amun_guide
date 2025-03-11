import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: BARONEMPAINPALACEEN(),
  ));
}

class BARONEMPAINPALACEEN extends StatelessWidget {
  const BARONEMPAINPALACEEN({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black.withOpacity(0.7), // Matches the theme
        elevation: 0, // Flat look
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.amber),
          onPressed: () {
            Navigator.pop(context); // Navigates back to the previous page
          },
        ),
        title: Text(
          'Baron Empain Palace',
          style: GoogleFonts.poppins(
            color: Colors.amber,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/images/Baron Empain Palace.png', // Ensure this image exists in your assets
              fit: BoxFit.cover,
            ),
          ),

          // Title and Description Box at the bottom
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.fromLTRB(
                  15, 15, 15, 80), // Increased padding at bottom
              color: Colors.black.withOpacity(0.7),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'BARON EMPAIN PALACE',
                    style: GoogleFonts.poppins(
                      color: Colors.amber,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'It is one of Cairo’s most unique architectural landmarks, built in the early 20th century by Belgian industrialist Baron Édouard Empain. Inspired by Hindu temples in India and Cambodian architecture, the palace features intricate carvings, grand columns, and an underground tunnel system. Located in Heliopolis, the palace was abandoned for decades but has since been restored and reopened as a cultural and historical museum. The palace\'s eerie history and mysterious design have made it a subject of fascination and intrigue among visitors.',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 14,
                      height: 1.3,
                    ),
                  ),
                  SizedBox(height: 20), // Added space between text and button
                ],
              ),
            ),
          ),

          // Watch Video Button
          Positioned(
            bottom: 15,
            right: 15,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              onPressed: () {
                // Video playback logic would go here
              },
              child: Text(
                'Click for more details',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
