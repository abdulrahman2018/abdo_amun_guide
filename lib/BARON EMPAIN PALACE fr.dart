import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: BARONEMPAINPALACEFR(),
  ));
}

class BARONEMPAINPALACEFR extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/images/Baron Empain Palace.png', // Make sure this image exists in your assets
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
                    'PALAIS DU BARON EMPAIN ',
                    style: GoogleFonts.poppins(
                      color: Colors.amber,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'C\'est l\'un des monuments architecturaux les plus uniques du Caire, construit au début du XXe siècle par l\'industriel belge Baron Édouard Empain. Inspiré des temples hindous de l\'Inde et de l\'architecture cambodgienne, le palais se distingue par ses sculptures détaillées, ses imposantes colonnes et son réseau souterrain de tunnels. Situé à Héliopolis, il a été abandonné pendant des décennies avant d\'être restauré et rouvert en tant que musée culturel et historique. L\'histoire énigmatique du palais et son design mystérieux en font un sujet de fascination et d\'intrigue pour les visiteurs.',
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
