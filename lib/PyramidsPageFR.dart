import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: PyramidsPageFR(),
  ));
}

class PyramidsPageFR extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/images/Pyramids of Giza.png', // Ensure the image is in the correct directory
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
                    'PYRAMIDES DE GIZA',
                    style: GoogleFonts.poppins(
                      color: Colors.amber,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Elles comptent parmi les monuments les plus célèbres au monde et témoignent de la grandeur de la civilisation égyptienne antique. Construit il y a plus de 4 500 ans, le complexe comprend la Grande Pyramide de Khéops, la Pyramide de Khéphren et la Pyramide de Mykérinos, ainsi que l\'emblématique Sphinx. Ces structures monumentales servaient de tombes pour les pharaons et ont été construites à l\'aide de millions de blocs de calcaire, démontrant les incroyables compétences en ingénierie des anciens Égyptiens. Aujourd\'hui, les pyramides restent un symbole de mystère et d\'émerveillement, attirant des millions de visiteurs venus admirer leur envergure et leur importance historique.',
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
