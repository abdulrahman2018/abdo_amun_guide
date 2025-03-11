import 'package:amun_guide/Azhar%20Mosque%20FR.dart';
import 'package:amun_guide/Azhar%20Mosque.dart';
import 'package:amun_guide/BARON%20EMPAIN%20PALACE%20fr.dart';
import 'package:amun_guide/BARON%20EMPAIN%20PALACE.dart';
import 'package:amun_guide/Cairo%20Tower%20FR.dart';
import 'package:amun_guide/Cairo%20Tower.dart';
import 'package:amun_guide/Citadel%20of%20Salah%20El-Dine%20FR.dart';
import 'package:amun_guide/Citadel%20of%20Salah%20El-Dine.dart';
import 'package:amun_guide/Coptic%20Cairo.dart';
import 'package:amun_guide/Crave%20Church%20FR.dart';
import 'package:amun_guide/Crave%20Church.dart';
import 'package:amun_guide/Egyptian%20Museum%20FR.dart';
import 'package:amun_guide/Egyptian%20Museum.dart';
import 'package:amun_guide/GRAND%20EGYPTIAN%20MUSEUM%20AR.dart';
import 'package:amun_guide/GRAND%20EGYPTIAN%20MUSEUM%20FR.dart';
import 'package:amun_guide/Grand%20Egyptian%20Museum.dart';
import 'package:amun_guide/Khan%20El-Khalili%20(ElMoez%20Street)%20FR.dart';
import 'package:amun_guide/Khan%20El-Khalili%20(ElMoez%20Street).dart';
import 'package:amun_guide/National%20Museum%20of%20Egyptian%20Civilization%20FR.dart';
import 'package:amun_guide/National%20Museum%20of%20Egyptian%20Civilization.dart';
import 'package:amun_guide/PyramidsPage.dart';
import 'package:amun_guide/PyramidsPageFR.dart';
import 'package:amun_guide/settings.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'PopularPlacesPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.amber,
        scaffoldBackgroundColor: Colors.black,
        appBarTheme:
            const AppBarTheme(backgroundColor: Colors.black, elevation: 0),
      ),
      home: HomePageFR(),
    );
  }
}

class HomePageFR extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePageFR> {
  final FocusNode _searchFocus = FocusNode();
  final TextEditingController _searchController = TextEditingController();
  bool _showSearchDropdown = false;

  final List<DestinationItem> _destinations = [
    DestinationItem(icon: Icons.landscape, title: 'PYRAMIDES DE GIZEH'),
    DestinationItem(icon: Icons.account_balance, title: 'GRAND MUSÉE ÉGYPTIEN'),
    DestinationItem(icon: Icons.location_city, title: 'TOUR DU CAIRE'),
    DestinationItem(icon: Icons.castle, title: 'PALAIS DU BARON EMPAIN'),
    DestinationItem(icon: Icons.church, title: 'LE CAIRE COPTE'),
    DestinationItem(icon: Icons.fort, title: 'CITADELLE DE SALAH EL-DINE'),
    DestinationItem(icon: Icons.store, title: 'KHAN EL-KHALILI (RUE ELMOEZ)'),
    DestinationItem(icon: Icons.account_balance, title: 'LE MUSÉE ÉGYPTIEN'),
    DestinationItem(
        icon: Icons.account_balance,
        title: 'MUSÉE NATIONAL DE LA CIVILISATION ÉGYPTIENNE (NMEC)'),
    DestinationItem(icon: Icons.mosque, title: 'MOSQUÉE AL-AZHAR'),
    DestinationItem(
        icon: Icons.church,
        title: 'ÉGLISE DES GROTTES\n(Monastère de Saint-Simon le Tanneur)'),
  ];

  @override
  void initState() {
    super.initState();
    _searchFocus.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    setState(() {
      _showSearchDropdown = _searchFocus.hasFocus;
    });
  }

  @override
  void dispose() {
    _searchFocus.removeListener(_onFocusChange);
    _searchFocus.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        setState(() {
          _showSearchDropdown = false;
        });
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Accueil',
              style: TextStyle(
                  color: Colors.amber,
                  fontSize: 24,
                  fontWeight: FontWeight.bold)),
          leading: IconButton(
              icon: const Icon(Icons.menu, color: Colors.amber, size: 30),
              onPressed: () {}),
          actions: [
            IconButton(
              icon: const Icon(Icons.settings, color: Colors.amber),
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SettingsPage())),
            ),
          ],
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[800],
                          borderRadius: BorderRadius.circular(25)),
                      child: Row(
                        children: [
                          const SizedBox(width: 10),
                          const Icon(Icons.landscape, color: Colors.white54),
                          const SizedBox(width: 10),
                          Expanded(
                            child: TextField(
                              controller: _searchController,
                              focusNode: _searchFocus,
                              decoration: const InputDecoration(
                                hintText: 'Où aller ?',
                                hintStyle: TextStyle(color: Colors.white54),
                                border: InputBorder.none,
                              ),
                              onTap: () {
                                setState(() {
                                  _showSearchDropdown = true;
                                });
                              },
                            ),
                          ),
                          const SizedBox(width: 10),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _showSearchDropdown = !_showSearchDropdown;
                                if (_showSearchDropdown)
                                  FocusScope.of(context)
                                      .requestFocus(_searchFocus);
                                else
                                  FocusScope.of(context).unfocus();
                              });
                            },
                            child: const Icon(Icons.visibility,
                                color: Colors.white54),
                          ),
                          const SizedBox(width: 10),
                        ],
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text('Région',
                        style: TextStyle(
                            color: Colors.amber,
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(
                    height: 50,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      children: [
                        _buildAreaButton('Le Caire'),
                        _buildAreaButton('Gizeh'),
                        _buildAreaButton('Le Caire'),
                        _buildAreaButton('Gizeh'),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Icon(Icons.local_fire_department, color: Colors.amber),
                        SizedBox(width: 8),
                        Text('Lieux Populaires',
                            style: TextStyle(
                                color: Colors.amber,
                                fontSize: 18,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  _buildPlaceCard(
                      'PYRAMIDES DE GIZEH', 'assets/images/pyramids.jpg'),
                  _buildPlaceCard(
                      'GRAND MUSÉE ÉGYPTIEN', 'assets/images/museum.jpg'),
                  _buildPlaceCard(
                      'TOUR DU CAIRE', 'assets/images/cairo_tower.jpg'),
                ],
              ),
            ),
            if (_showSearchDropdown)
              Positioned(
                top: 80,
                left: 16,
                right: 16,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[900],
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey[800]!)),
                  constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height * 0.6),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: _destinations.length,
                    itemBuilder: (context, index) {
                      return DestinationListTile(
                        destination: _destinations[index],
                        onTap: () {
                          setState(() {
                            _showSearchDropdown = false;
                            _searchController.text = _destinations[index].title;
                          });
                          FocusScope.of(context).unfocus();
                          if (_destinations[index].title ==
                              'PYRAMIDES DE GIZEH') {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PyramidsPageFR()));
                          } else if (_destinations[index].title ==
                              'GRAND MUSÉE ÉGYPTIEN') {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        GRANDGYPTIANMUSEUMFR()));
                          } else if (_destinations[index].title ==
                              'TOUR DU CAIRE') {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CairoTowerFR()));
                          } else if (_destinations[index].title ==
                              'PALAIS DU BARON EMPAIN') {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        BARONEMPAINPALACEFR()));
                          } else if (_destinations[index].title ==
                              'LE CAIRE COPTE') {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CaveChurchFR()));
                          } else if (_destinations[index].title ==
                              'CITADELLE DE SALAH EL-DINE') {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        CITADELOFSALAHELDINEFR()));
                          } else if (_destinations[index].title ==
                              'KHAN EL-KHALILI (RUE ELMOEZ)') {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => KHANELKHALILIFR()));
                          } else if (_destinations[index].title ==
                              'LE MUSÉE ÉGYPTIEN') {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        TheEGYPTIANMUSEUMENFR()));
                          } else if (_destinations[index].title ==
                              'MUSÉE NATIONAL DE LA CIVILISATION ÉGYPTIENNE (NMEC)') {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        NATIONALMUSEUMOFEGYPTIANCIVILIZATIONFR()));
                          } else if (_destinations[index].title ==
                              'MOSQUÉE AL-AZHAR') {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ALAZHAMOSQUEFR()));
                          } else if (_destinations[index].title ==
                              'ÉGLISE DES GROTTES\n(Monastère de Saint-Simon le Tanneur)') {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CaveChurchFR()));
                          }
                        },
                      );
                    },
                  ),
                ),
              ),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.black,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BottomNavItem(icon: Icons.home, label: 'Accueil', isActive: true),
              BottomNavItem(
                icon: Icons.smart_toy,
                label: 'Amun-Bot',
                isActive: false,
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AmunBotPageFR())),
              ),
              BottomNavItem(
                icon: Icons.settings,
                label: 'Paramètres',
                isActive: false,
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SettingsPage())),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAreaButton(String title) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          foregroundColor: Colors.white,
          side: const BorderSide(color: Colors.white),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        ),
        child: Text(title),
      ),
    );
  }

  Widget _buildPlaceCard(String title, String imagePath) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(imagePath,
                fit: BoxFit.cover, width: double.infinity, height: 200),
          ),
          Positioned(
            top: 16,
            left: 16,
            child: Text(title,
                style: const TextStyle(
                    color: Colors.amber,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
          ),
          Positioned(
            bottom: 10,
            right: 10,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                  color: Colors.amber, borderRadius: BorderRadius.circular(10)),
              child: const Text('Cliquez pour plus de détails',
                  style: TextStyle(color: Colors.black, fontSize: 12)),
            ),
          ),
        ],
      ),
    );
  }
}

// Amun-Bot Page in French
class AmunBotPageFR extends StatefulWidget {
  @override
  _AmunBotPageState createState() => _AmunBotPageState();
}

class _AmunBotPageState extends State<AmunBotPageFR> {
  Database? _database;
  List<Map<String, dynamic>> _questions = [];
  String _selectedAnswer = '';

  @override
  void initState() {
    super.initState();
    _initializeDatabase();
  }

  Future<void> _initializeDatabase() async {
    try {
      final databasePath = await getDatabasesPath();
      final path = join(databasePath, 'amun_bot_fr.db');

      _database = await openDatabase(
        path,
        version: 1,
        onCreate: (db, version) async {
          await db.execute('''
            CREATE TABLE qa_pairs (
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              question TEXT NOT NULL,
              response TEXT NOT NULL
            )
          ''');
          await db.insert('qa_pairs', {
            'question': 'Que sont les Pyramides de Gizeh ?',
            'response':
                'Les Pyramides de Gizeh sont des structures anciennes construites comme tombeaux pour les pharaons.'
          });
          await db.insert('qa_pairs', {
            'question': 'Où se trouve la Tour du Caire ?',
            'response':
                'La Tour du Caire est située au Caire, en Égypte, sur l’île de Gezira.'
          });
          await db.insert('qa_pairs', {
            'question': 'Qu’est-ce que le Grand Musée Égyptien ?',
            'response':
                'Le Grand Musée Égyptien est un musée moderne près du plateau de Gizeh, abritant des artefacts égyptiens.'
          });
        },
      );

      _loadQuestions();
    } catch (e) {
      print('Erreur lors de l’initialisation de la base de données : $e');
    }
  }

  Future<void> _loadQuestions() async {
    if (_database == null) return;
    final questions = await _database!.query('qa_pairs');
    setState(() {
      _questions = questions;
    });
  }

  Future<void> _fetchAnswer(int id) async {
    if (_database == null) return;
    final result =
        await _database!.query('qa_pairs', where: 'id = ?', whereArgs: [id]);
    if (result.isNotEmpty) {
      setState(() {
        _selectedAnswer = result.first['response'] as String;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Amun-Bot', style: TextStyle(color: Colors.amber)),
      ),
      body: Column(
        children: [
          Expanded(
            child: _questions.isEmpty
                ? const Center(
                    child: CircularProgressIndicator(color: Colors.amber))
                : ListView.builder(
                    itemCount: _questions.length,
                    itemBuilder: (context, index) {
                      final question = _questions[index];
                      return ListTile(
                        title: Text(question['question'],
                            style: const TextStyle(color: Colors.white)),
                        onTap: () => _fetchAnswer(question['id']),
                      );
                    },
                  ),
          ),
          if (_selectedAnswer.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                    color: Colors.grey[800],
                    borderRadius: BorderRadius.circular(10)),
                child: Text(_selectedAnswer,
                    style: const TextStyle(color: Colors.white, fontSize: 16)),
              ),
            ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _database?.close();
    super.dispose();
  }
}

class BottomNavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isActive;
  final VoidCallback? onTap;

  const BottomNavItem(
      {Key? key,
      required this.icon,
      required this.label,
      this.isActive = false,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: isActive ? Colors.amber : Colors.white54, size: 30),
          Text(label,
              style:
                  TextStyle(color: isActive ? Colors.amber : Colors.white54)),
        ],
      ),
    );
  }
}

class DestinationItem {
  final IconData icon;
  final String title;

  DestinationItem({required this.icon, required this.title});
}

class DestinationListTile extends StatelessWidget {
  final DestinationItem destination;
  final VoidCallback onTap;

  const DestinationListTile(
      {Key? key, required this.destination, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(destination.icon, color: Colors.amber, size: 28),
      title: Text(destination.title,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold)),
      onTap: onTap,
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
    );
  }
}
