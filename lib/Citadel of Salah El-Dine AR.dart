import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: CITADELOFSALAHELDINEAR(),
  ));
}

class CITADELOFSALAHELDINEAR extends StatelessWidget {
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
                'assets/images/Citadel of Salah El-Dine.png',
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
                      'قلعة صلاح الدين ',
                      style: GoogleFonts.poppins(
                        color: Colors.amber,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'قلعة صلاح الدين هي قلعة إسلامية من العصور الوسطى بناها صلاح الدين في القرن الثاني عشر للدفاع عن القاهرة ضد الغزوات الصليبية. كانت بمثابة مقر حكومة مصر لعدة قرون وتظل واحدة من أهم المواقع التاريخية في المدينة. داخل أسوارها الضخمة، يمكن للزوار استكشاف مسجد محمد علي الرائع، المعروف أيضًا باسم مسجد المرمر (مسجد الالبستر)، بالإضافة إلى المتاحف والقصور الأخرى. توفر القلعة إطلالات خلابة على القاهرة وهي مثال رئيسي للهندسة المعمارية العسكرية الإسلامية.',
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
