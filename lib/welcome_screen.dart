import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(AmunGuideApp());
}

class AmunGuideApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final List<Map<String, String>> places = [
    {'title': 'PYRAMIDS OF GIZA', 'image': 'assets/images/pyramids.jpg'},
    {'title': 'GRAND EGYPTIAN MUSEUM', 'image': 'assets/images/museum.jpg'},
    {'title': 'CAIRO TOWER', 'image': 'assets/images/cairo_tower.jpg'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.amber),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
        title: Text(
          'Home',
          style: GoogleFonts.poppins(color: Colors.amber, fontSize: 22),
        ),
        centerTitle: true,
      ),
      drawer: Drawer(),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Assuming SearchBarWidget is a custom widget that needs to be defined or imported
              // For demonstration, let's replace it with a simple TextField for search functionality
              TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search, color: Colors.amber),
                  labelText: 'Search',
                  labelStyle: TextStyle(color: Colors.amber),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 15),
              Text(
                '🔥 Popular Places',
                style: GoogleFonts.poppins(
                  color: Colors.amber,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: places.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(places[index]['title']!),
                      leading: Image.asset(places[index]['image']!),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}

class BottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.black,
      selectedItemColor: Colors.amber,
      unselectedItemColor: Colors.white70,
      items: [
        BottomNavigationBarItem(
            icon: Image.asset('assets/icons/Museum.png', width: 24, height: 24),
            label: 'Museum'),
        BottomNavigationBarItem(
            icon:
                Image.asset('assets/icons/Monument.png', width: 24, height: 24),
            label: 'Monument'),
        BottomNavigationBarItem(
            icon: Image.asset('assets/icons/Palace.png', width: 24, height: 24),
            label: 'Palace'),
        BottomNavigationBarItem(
            icon: Image.asset('assets/icons/Church.png', width: 24, height: 24),
            label: 'Church'),
        BottomNavigationBarItem(
            icon: Image.asset('assets/icons/AL AZHAR MOSQUE.png',
                width: 24, height: 24),
            label: 'Al Azhar Mosque'),
        BottomNavigationBarItem(
            icon: Image.asset(
                'assets/icons/NATIONAL MUSEUM OF EGYPTIAN CIVILIZATION (NMEC).png',
                width: 24,
                height: 24),
            label: 'NMEC'),
        BottomNavigationBarItem(
            icon: Image.asset('assets/icons/The EGYPTIAN MUSEUM.png',
                width: 24, height: 24),
            label: 'Egyptian Museum'),
        BottomNavigationBarItem(
            icon: Image.asset(
                'assets/icons/KHAN EL-KHALILI (ELMOEZ STREET).png',
                width: 24,
                height: 24),
            label: 'Khan El-Khalili'),
        BottomNavigationBarItem(
            icon: Image.asset('assets/icons/Cave Church.png',
                width: 24, height: 24),
            label: 'Cave Church'),
      ],
    );
  }
}
