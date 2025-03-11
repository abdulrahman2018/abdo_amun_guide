import 'package:amun_guide/homeFR.dart';
import 'package:amun_guide/main.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xFFFFC107)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Paramètres', // Translated to French
          style: TextStyle(color: Color(0xFFFFC107), fontSize: 24),
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'GÉNÉRAL', // Translated to French
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            LanguageDropdown(),
            SizedBox(height: 20),
            HomePageButton(),
            SizedBox(height: 20),
            LogoutButton(),
          ],
        ),
      ),
    );
  }
}

class HomePageButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          color: Color(0xFFFFC107),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            'Page d\'Accueil', // Translated to French
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

class LanguageDropdown extends StatefulWidget {
  @override
  _LanguageDropdownState createState() => _LanguageDropdownState();
}

class _LanguageDropdownState extends State<LanguageDropdown> {
  String selectedLanguage = 'EN';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          dropdownColor: Colors.black,
          icon: Icon(Icons.arrow_drop_down, color: Colors.white),
          value: selectedLanguage,
          onChanged: (String? newValue) {
            setState(() {
              selectedLanguage = newValue!;
              // Navigate based on language selection
              if (selectedLanguage == 'FR') {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomePageFR()),
                );
              } else if (selectedLanguage == 'EN') {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          HomePage1()), // Assuming HomePage1 is English version
                );
              }
              // Add navigation for 'AR' if you have an Arabic version
            });
          },
          items: [
            DropdownMenuItem(
              value: 'EN',
              child: Row(
                children: [
                  Text('🇺🇸', style: TextStyle(fontSize: 20)), // USA Flag
                  SizedBox(width: 10),
                  Text('Anglais',
                      style: TextStyle(
                          color: Colors.white)), // Translated to French
                ],
              ),
            ),
            DropdownMenuItem(
              value: 'FR',
              child: Row(
                children: [
                  Text('🇫🇷', style: TextStyle(fontSize: 20)), // France Flag
                  SizedBox(width: 10),
                  Text('Français', style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
            DropdownMenuItem(
              value: 'AR',
              child: Row(
                children: [
                  Text('🇸🇦',
                      style: TextStyle(fontSize: 20)), // Saudi Arabia Flag
                  SizedBox(width: 10),
                  Text('Arabe',
                      style: TextStyle(
                          color: Colors.white)), // Translated to French
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LogoutButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Handle logout action
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            'Déconnexion', // Translated to French
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
