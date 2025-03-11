import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ALAZHAMOSQUEEN(),
  ));
}

class ALAZHAMOSQUEEN extends StatelessWidget {
  const ALAZHAMOSQUEEN({Key? key}) : super(key: key);

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
          'Al Azhar Mosque',
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
              'assets/images/Azhar Mosque.png', // Ensure this image exists in your assets
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
                  15, 15, 15, 60), // Additional padding at bottom for button
              color: Colors.black.withOpacity(0.7),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'AL AZHAR MOSQUE',
                    style: GoogleFonts.poppins(
                      color: Colors.amber,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Al-Azhar Mosque is one of the most important religious and educational institutions in the Islamic world. Founded in 970 AD during the Fatimid Caliphate, it later became the heart of Islamic scholarship and remains a prestigious university to this day. The mosque’s architecture showcases a blend of different Islamic styles, with elegant minarets, intricate calligraphy, and a grand courtyard. Al-Azhar continues to be a center of learning, where scholars from around the world come to study Islamic theology, law, and Arabic language.',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 14,
                      height: 1.3,
                    ),
                  ),
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
