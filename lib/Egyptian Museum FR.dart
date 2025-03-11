import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: TheEGYPTIANMUSEUMENFR(),
  ));
}

class TheEGYPTIANMUSEUMENFR extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/images/Grand Egyptian Museum.png', // Ensure the image is in the correct directory
              fit: BoxFit.cover,
            ),
          ),

          // Content Overlay
          Positioned(
            top: 80,
            left: 20,
            right: 20,
            child: Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.grey[850]?.withOpacity(0.9),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Le MUSÉE ÉGYPTIEN',
                    style: GoogleFonts.poppins(
                      color: Colors.amber,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Located on Tahrir Square, the Egyptian Museum in Cairo houses one of the largest collections of ancient Egyptian artifacts in the world. It contains over 120,000 objects, including royal mummies, statues, jewelry, and everyday objects from ancient Egypt. Founded in 1902, the museum offers an unparalleled glimpse into the life and beliefs of one of the most fascinating civilizations in history. The Egyptian Museum remains a culturally and historically essential site.',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),

          // Watch Video Button
          Positioned(
            bottom: 40,
            left: 20,
            right: 20,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
                padding: EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                // TODO: Add video navigation logic
              },
              child: Text(
                'Cliquez pour plus de détails',
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
