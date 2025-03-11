import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: TheEGYPTIANMUSEUMEN(),
  ));
}

class TheEGYPTIANMUSEUMEN extends StatelessWidget {
  const TheEGYPTIANMUSEUMEN({Key? key}) : super(key: key);

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
          'The Egyptian Museum',
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
              'assets/images/Grand Egyptian Museum.png', // Ensure the correct image is used
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
                    'THE EGYPTIAN MUSEUM',
                    style: GoogleFonts.poppins(
                      color: Colors.amber,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Located in Tahrir Square, the Egyptian Museum in Cairo is home to one of the world\'s most extensive collections of ancient Egyptian artifacts. It houses over 120,000 items, including royal mummies, statues, jewelry, and everyday objects from ancient Egypt. The museum, established in 1902, offers an unparalleled insight into the lives and beliefs of one of the most fascinating civilizations in history. The Egyptian Museum remains a crucial cultural and historical landmark.',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'These massive structures served as tombs for pharaohs and were constructed using millions of limestone blocks, showcasing the incredible engineering skills of the ancient Egyptians. Today, the pyramids remain a symbol of mystery and wonder, attracting millions of visitors who come to marvel at their scale and historical significance.',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
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
