import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: KHANELKHALILIAR(),
  ));
}

class KHANELKHALILIAR extends StatelessWidget {
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
                      'خان الخليلي (شارع المعز) ',
                      style: GoogleFonts.poppins(
                        color: Colors.amber,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'خان الخليلي هو البازار الأشهر والأعرق في القاهرة، ويعود تاريخه إلى القرن الرابع عشر. إنه سوق مزدحم حيث يمكن للزوار العثور على الحرف اليدوية المصرية التقليدية والمجوهرات والتحف والهدايا التذكارية. وتعتبر المنطقة المحيطة، وخاصة شارع المعز، موطنًا لبعض أجمل العمارة الإسلامية في العصور الوسطى، مع المساجد والمنازل التاريخية. ويشتهر البازار أيضًا بمقاهيه التقليدية، مثل مقهى الفيشاوي، حيث يمكن للزوار الاستمتاع بالشاي المصري مع الاستمتاع بالأجواء المفعمة بالحيوية.',
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
