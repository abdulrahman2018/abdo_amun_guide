import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: NATIONALMUSEUMOFEGYPTIANCIVILIZATIONAR(),
  ));
}

class NATIONALMUSEUMOFEGYPTIANCIVILIZATIONAR extends StatelessWidget {
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
                'assets/images/National Museum of Egyptian Civilization.png', // Ensure the image is in the correct directory
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
                      'المتحف القومي للحضارة المصرية',
                      style: GoogleFonts.poppins(
                        color: Colors.amber,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'المتحف القومي للحضارة المصرية هو متحف حديث مخصص لعرض تاريخ مصر منذ عصور ما قبل التاريخ وحتى الوقت الحاضر. ومن أهم معالمه السياحية قاعة المومياوات الملكية التي تضم بقايا مومياوات محنطة لبعض أشهر الفراعنة في مصر، بما في ذلك رمسيس الثاني وحتشبسوت. يقدم المتحف رحلة زمنية عبر التاريخ المصري، ويضم قطعًا أثرية من عصور مختلفة، ومعروضات تفاعلية، وعروضًا متعددة الوسائط، مما يجعله وجهة أساسية لأولئك الذين يسعون إلى فهم شامل للتراث الثقافي الواسع في مصر.',
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
