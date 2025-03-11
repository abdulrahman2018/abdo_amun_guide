import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: EgyptianMuseumPage(),
  ));
}

class EgyptianMuseumPage extends StatelessWidget {
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
                    'البارون ',
                    style: GoogleFonts.poppins(
                      color: Colors.amber,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'وهو أحد المعالم المعمارية الفريدة في القاهرة، تم بناؤه في أوائل القرن العشرين على يد الصنايعي البلجيكي البارون إدوارد إمبان. يتميز القصر، المستوحى من المعابد الهندوسية في الهند والهندسة المعمارية الكمبودية، بنقوشه التفصيلية وأعمدته المهيبة وشبكة الأنفاق تحت الأرض. يقع هذا المتحف في حي مصر الجديدة، وقد ظل مهجورًا لعقود من الزمن قبل أن يتم ترميمه وإعادة افتتاحه كمتحف ثقافي وتاريخي. إن تاريخ القصر الغامض وتصميمه الغامض يجعلانه موضوعًا مثيرًا للاهتمام والفضول للزوار..',
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
                'انقر للمزيد من التفاصيل',
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
