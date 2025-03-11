
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: GRANDGYPTIANMUSEUMAR(),
  ));
}

class GRANDGYPTIANMUSEUMAR extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Stack(
          children: [
            // Background Image
            Positioned.fill(
              child: Image.asset(
              'assets/images/museum.jpg', // Make sure this image exists in your assets
                fit: BoxFit.cover,
              ),
            ),

            // Title and Description Box at the bottom
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.fromLTRB(15, 15, 15, 80),
                color: Colors.black.withOpacity(0.7),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                    'المتحف المصري الكبير ',
                      style: GoogleFonts.poppins(
                        color: Colors.amber,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                    'يعتبر المتحف المصري الكبير (GEM) من أكبر متحف أثري في العالم، ويخدم المجموعة الكاملة لكنوز الملك توت عنخ آمون، إلى جانب آلاف القطع الأثرية القديمة الأخرى. يقع المتحف بالقرب من أهرامات الجيزة، وقد تم تصميمه لتوفير تجربة غامرة، تتميز بالتكنولوجيا المتقدمة والمعروضات التفاعلية. يعمل المتحف المصري الكبير كمركز ثقافي، يحافظ على تراث مصر الغني بينما يوفر للزوار اتصالاً أعمق بماضيها القديم.',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 14,
                        height: 1.3,
                      ),
                    ),
                    SizedBox(height: 20),
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
      ),
    );
  }
}
