import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ALAZHAMOSQUEAR(),
  ));
}

class ALAZHAMOSQUEAR extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/images/Azhar Mosque.png', // Make sure this image exists in your assets
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
                    'جامع الازهر ',
                    style: GoogleFonts.poppins(
                      color: Colors.amber,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    ' يعد جامع الأزهر أحد أهم المؤسسات الدينية والتعليمية في العالم الإسلامي. تأسس عام 970 م في عهد الخلافة الفاطمية، وأصبح فيما بعد قلب العلوم الإسلامية ولا يزال جامع مرموق حتى يومنا هذا. تعرض هندسة المسجد مزيجًا من الأساليب الإسلامية المختلفة، مع مآذنة أنيقة وفناء كبير. لا يزال الأزهر مركزًا للتعلم، حيث يأتي العلماء من جميع أنحاء العالم لدراسة علم اصول الدين الإسلامي والقانون واللغة العربية..',
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
