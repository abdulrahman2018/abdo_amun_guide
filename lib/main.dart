import 'package:amun_guide/Azhar%20Mosque.dart';
import 'package:amun_guide/BARON%20EMPAIN%20PALACE.dart';
import 'package:amun_guide/Cairo%20Tower.dart';
import 'package:amun_guide/Citadel%20of%20Salah%20El-Dine.dart';
import 'package:amun_guide/Coptic%20Cairo.dart';
import 'package:amun_guide/Crave%20Church.dart';
import 'package:amun_guide/Egyptian%20Museum.dart';
import 'package:amun_guide/GRAND%20EGYPTIAN%20MUSEUM%20AR.dart';
import 'package:amun_guide/Grand%20Egyptian%20Museum.dart';
import 'package:amun_guide/Khan%20El-Khalili%20(ElMoez%20Street).dart';
import 'package:amun_guide/National%20Museum%20of%20Egyptian%20Civilization.dart';
import 'package:amun_guide/PyramidsPage.dart';
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
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          elevation: 0,
        ),
      ),
      home: HomePage1(),
    );
  }
}

class HomePage1 extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage1> {
  final FocusNode _searchFocus = FocusNode();
  final TextEditingController _searchController = TextEditingController();
  bool _showSearchDropdown = false;

  final List<DestinationItem> _destinations = [
    DestinationItem(icon: Icons.landscape, title: 'PYRAMIDS OF GIZA'),
    DestinationItem(
        icon: Icons.account_balance, title: 'GRAND EGYPTIAN MUSEUM'),
    DestinationItem(icon: Icons.location_city, title: 'CAIRO TOWER'),
    DestinationItem(icon: Icons.castle, title: 'BARON EMPAIN PALACE'),
    DestinationItem(icon: Icons.church, title: 'COPTIC CAIRO'),
    DestinationItem(icon: Icons.fort, title: 'CITADEL OF SALAH EL-DINE'),
    DestinationItem(
        icon: Icons.store, title: 'KHAN EL-KHALILI (ELMOEZ STREET)'),
    DestinationItem(icon: Icons.account_balance, title: 'The EGYPTIAN MUSEUM'),
    DestinationItem(
        icon: Icons.account_balance,
        title: 'NATIONAL MUSEUM OF EGYPTIAN CIVILIZATION (NMEC)'),
    DestinationItem(icon: Icons.mosque, title: 'AL AZHAR MOSQUE'),
    DestinationItem(
        icon: Icons.church,
        title: 'Cave Church\n(Saint Simon the Tanner Monastery)'),
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
          title: const Text(
            'Home',
            style: TextStyle(
                color: Colors.amber, fontSize: 24, fontWeight: FontWeight.bold),
          ),
          leading: IconButton(
            icon: const Icon(Icons.menu, color: Colors.amber, size: 30),
            onPressed: () {},
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.settings, color: Colors.amber),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SettingsPage()));
              },
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
                        borderRadius: BorderRadius.circular(25),
                      ),
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
                                hintText: 'Where to go?',
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
                                if (_showSearchDropdown) {
                                  FocusScope.of(context)
                                      .requestFocus(_searchFocus);
                                } else {
                                  FocusScope.of(context).unfocus();
                                }
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
                    child: Text(
                      'Area',
                      style: TextStyle(
                          color: Colors.amber,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      children: [
                        _buildAreaButton('Cairo'),
                        _buildAreaButton('Giza'),
                        _buildAreaButton('Cairo'),
                        _buildAreaButton('Giza'),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Icon(Icons.local_fire_department, color: Colors.amber),
                        SizedBox(width: 8),
                        Text(
                          'Popular Places',
                          style: TextStyle(
                              color: Colors.amber,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  _buildPlaceCard(
                      'PYRAMIDS OF GIZA', 'assets/images/pyramids.jpg'),
                  _buildPlaceCard(
                      'GRAND EGYPTIAN MUSEUM', 'assets/images/museum.jpg'),
                  _buildPlaceCard(
                      'CAIRO TOWER', 'assets/images/cairo_tower.jpg'),
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
                    border: Border.all(color: Colors.grey[800]!),
                  ),
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
                              'PYRAMIDS OF GIZA') {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PyramidsPage()));
                          } else if (_destinations[index].title ==
                              'GRAND EGYPTIAN MUSEUM') {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        GRANDGYPTIANMUSEUMEN()));
                          } else if (_destinations[index].title ==
                              'CAIRO TOWER') {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CairoTowerEN()));
                          } else if (_destinations[index].title ==
                              'BARON EMPAIN PALACE') {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        BARONEMPAINPALACEEN()));
                          } else if (_destinations[index].title ==
                              'COPTIC CAIRO') {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => COPTICCAIROEN()));
                          } else if (_destinations[index].title ==
                              'CITADEL OF SALAH EL-DINE') {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        CITADELOFSALAHELDINEEN()));
                          } else if (_destinations[index].title ==
                              'KHAN EL-KHALILI (ELMOEZ STREET)') {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => KHANELKHALILIEN()));
                          } else if (_destinations[index].title ==
                              'The EGYPTIAN MUSEUM') {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        TheEGYPTIANMUSEUMEN()));
                          } else if (_destinations[index].title ==
                              'NATIONAL MUSEUM OF EGYPTIAN CIVILIZATION (NMEC)') {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        NATIONALMUSEUMOFEGYPTIANCIVILIZATIONEN()));
                          } else if (_destinations[index].title ==
                              'AL AZHAR MOSQUE') {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ALAZHAMOSQUEEN()));
                          } else if (_destinations[index].title ==
                              'Cave Church\n(Saint Simon the Tanner Monastery)') {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CaveChurchEN()));
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
              BottomNavItem(icon: Icons.home, label: 'Home', isActive: true),
              BottomNavItem(
                icon: Icons.smart_toy,
                label: 'Amun-Bot',
                isActive: false,
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AmunBotPage()));
                },
              ),
              BottomNavItem(
                icon: Icons.settings,
                label: 'Settings',
                isActive: false,
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SettingsPage()));
                },
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
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 200,
            ),
          ),
          Positioned(
            top: 16,
            left: 16,
            child: Text(
              title,
              style: const TextStyle(
                  color: Colors.amber,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
            bottom: 10,
            right: 10,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                  color: Colors.amber, borderRadius: BorderRadius.circular(10)),
              child: const Text('Click for more details',
                  style: TextStyle(color: Colors.black, fontSize: 12)),
            ),
          ),
        ],
      ),
    );
  }
}

// Amun-Bot Page
class AmunBotPage extends StatefulWidget {
  @override
  _AmunBotPageState createState() => _AmunBotPageState();
}

class _AmunBotPageState extends State<AmunBotPage> {
  Database? _database;
  List<Map<String, dynamic>> _questions = [];
  List<Map<String, String>> _conversation = [];
  final TextEditingController _messageController = TextEditingController();
  bool _showSuggestions = false;

  @override
  void initState() {
    super.initState();
    _initializeDatabase();
  }

  Future<void> _initializeDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'amun_bot.db');

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
        await db.execute('''
          CREATE TABLE conversations (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            type TEXT NOT NULL,
            message TEXT NOT NULL,
            timestamp INTEGER NOT NULL
          )
        ''');
        await db.insert('qa_pairs', {
          'question': 'What is the Pyramids of Giza?',
          'response':
              'The Pyramids of Giza are ancient structures built as tombs for pharaohs.'
        });
        await db.insert('qa_pairs', {
          'question': 'Where is Cairo Tower?',
          'response':
              'Cairo Tower is located in Cairo, Egypt, on Gezira Island.'
        });
        await db.insert('qa_pairs', {
          'question': 'What is the Grand Egyptian Museum?',
          'response':
              'The Grand Egyptian Museum is a modern museum near the Giza Plateau, housing Egyptian artifacts.'
        });
      },
    );

    await _loadQuestions();
    await _loadConversations();
  }

  Future<void> _loadQuestions() async {
    final questions = await _database!.query('qa_pairs');
    setState(() {
      _questions = questions;
    });
  }

  Future<void> _loadConversations() async {
    final conversations = await _database!.query(
      'conversations',
      orderBy: 'timestamp ASC',
    );
    setState(() {
      _conversation = conversations
          .map((row) => {
                'type': row['type'] as String,
                'message': row['message'] as String,
              })
          .toList();
    });
  }

  Future<void> _saveConversation(String type, String message) async {
    await _database!.insert('conversations', {
      'type': type,
      'message': message,
      'timestamp': DateTime.now().millisecondsSinceEpoch,
    });
  }

  Future<void> _fetchAnswer(String question) async {
    final result = await _database!
        .query('qa_pairs', where: 'question = ?', whereArgs: [question]);
    String response;
    if (result.isNotEmpty) {
      response = result.first['response'] as String;
    } else {
      response = 'Sorry, I don’t have an answer for that yet!';
    }
    setState(() {
      _conversation.add({'type': 'bot', 'message': response});
    });
    await _saveConversation('bot', response);
  }

  void _sendMessage() {
    if (_messageController.text.isNotEmpty) {
      String userMessage = _messageController.text;
      setState(() {
        _conversation.add({'type': 'user', 'message': userMessage});
        _showSuggestions = false;
      });
      _saveConversation('user', userMessage);
      _fetchAnswer(userMessage);
      _messageController.clear();
    }
  }

  Future<void> _clearConversations() async {
    await _database!.delete('conversations');
    setState(() {
      _conversation.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Amun-Bot', style: TextStyle(color: Colors.amber)),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete, color: Colors.amber),
            onPressed: _clearConversations,
          ),
        ],
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(16.0),
                  itemCount: _conversation.length,
                  itemBuilder: (context, index) {
                    final message = _conversation[index];
                    final isUser = message['type'] == 'user';
                    return Align(
                      alignment:
                          isUser ? Alignment.centerRight : Alignment.centerLeft,
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 4.0),
                        padding: const EdgeInsets.all(12.0),
                        decoration: BoxDecoration(
                          color: isUser ? Colors.amber : Colors.grey[800],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          message['message']!,
                          style: TextStyle(
                            color: isUser ? Colors.black : Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _messageController,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: 'Ask Amun-Bot...',
                          hintStyle: const TextStyle(color: Colors.white54),
                          filled: true,
                          fillColor: Colors.grey[800],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            _showSuggestions = true;
                          });
                        },
                        onSubmitted: (_) => _sendMessage(),
                      ),
                    ),
                    const SizedBox(width: 8),
                    IconButton(
                      icon: const Icon(Icons.send, color: Colors.amber),
                      onPressed: _sendMessage,
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (_showSuggestions && _questions.isNotEmpty)
            Positioned(
              bottom: 80,
              left: 16,
              right: 16,
              child: Container(
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height * 0.3,
                ),
                decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey[800]!),
                ),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: _questions.length,
                  itemBuilder: (context, index) {
                    final question = _questions[index]['question'] as String;
                    return ListTile(
                      title: Text(
                        question,
                        style: const TextStyle(color: Colors.white),
                      ),
                      onTap: () {
                        setState(() {
                          _messageController.text = question;
                          _showSuggestions = false;
                        });
                      },
                    );
                  },
                ),
              ),
            ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _database?.close();
    _messageController.dispose();
    super.dispose();
  }
}

class BottomNavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isActive;
  final VoidCallback? onTap;

  const BottomNavItem({
    Key? key,
    required this.icon,
    required this.label,
    this.isActive = false,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: isActive ? Colors.amber : Colors.white54, size: 30),
          Text(
            label,
            style: TextStyle(color: isActive ? Colors.amber : Colors.white54),
          ),
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

  const DestinationListTile({
    Key? key,
    required this.destination,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(destination.icon, color: Colors.amber, size: 28),
      title: Text(
        destination.title,
        style:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      onTap: onTap,
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
    );
  }
}
