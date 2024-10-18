import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Désactive la bannière debug
      home: HomeProPage(), // Définit la page d'accueil comme HomeProPage
    );
  }
}

// Page Home Pro
class HomeProPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Pro Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigation vers la page de sélection de pays et carte bancaire
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => QuestionPage()),
            );
          },
          child: Text('Welcome'),
        ),
      ),
    );
  }
}

// Page des questions : pays et carte bancaire
class QuestionPage extends StatefulWidget {
  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  String selectedCountry = ''; // Stocke le pays sélectionné
  String selectedCard = ''; // Stocke la carte bancaire sélectionnée
  String result = ''; // Stocke le résultat final

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sélectionnez votre pays et carte'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Choisissez votre pays:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            // Boutons pour les pays
            ElevatedButton(
              onPressed: () {
                setState(() {
                  selectedCountry = 'Tunisie';
                });
              },
              child: Text('Tunisie'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  selectedCountry = 'France';
                });
              },
              child: Text('France'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  selectedCountry = 'Italie';
                });
              },
              child: Text('Italie'),
            ),
            SizedBox(height: 30),

            if (selectedCountry
                .isNotEmpty) // Si un pays est sélectionné, affiche les choix de carte
              Column(
                children: [
                  Text(
                    'Choisissez votre carte bancaire:',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedCard = 'Visa';
                      });
                    },
                    child: Text('Visa'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedCard = 'MasterCard';
                      });
                    },
                    child: Text('MasterCard'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedCard = 'American Express';
                      });
                    },
                    child: Text('American Express'),
                  ),
                ],
              ),
            SizedBox(height: 30),

            // Si un pays et une carte sont sélectionnés, afficher le résultat
            if (selectedCountry.isNotEmpty && selectedCard.isNotEmpty)
              Column(
                children: [
                  Text(
                    'Vous avez sélectionné:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Pays: $selectedCountry, Carte: $selectedCard',
                    style: TextStyle(fontSize: 16, color: Colors.green),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
