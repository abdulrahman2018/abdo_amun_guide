import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: CairoTowerAR(),
  ));
}

class CairoTowerAR extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/images/Cairo Tower.png', // Ensure the image is in the correct directory
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
                    'برج القاهرة',
                    style: GoogleFonts.poppins(
                      color: Colors.amber,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'إنه أعجوبة معمارية حديثة يبلغ ارتفاعها 187 مترًا، مما يجعلها واحدة من أطول الهياكل في مصر وشمال إفريقيا. تم الانتهاء من بناء البرج في عام 1961، وصُمم ليشبه زهرة اللوتس، وهي رمز مهم في الثقافة المصرية القديمة. يوفر إطلالات بانورامية خلابة على القاهرة، بما في ذلك نهر النيل والأهرامات في المسافة والشوارع الصاخبة أدناه. يتميز البرج أيضًا بمطعم دوار، مما يجعله وجهة شهيرة للسياح والسكان المحليين الذين يتطلعون إلى تجربة جمال القاهرة من الأعلى.',
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
