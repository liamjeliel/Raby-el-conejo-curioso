import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'La Aventura de Rabi',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const StoryPage(),
    );
  }
}

class StoryPage extends StatefulWidget {
  const StoryPage({super.key});

  @override
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  String _storyText = 'Rabi, el conejo curioso, encuentra una cueva misteriosa cerca del río Brillante. Sus amigos, Tina y Sabio, le advierten sobre los peligros.';
  int _choice = 0;
  String _imagePath = 'images/rabi3.jpg';

  void _makeChoice(int choice) {
    setState(() {
      _choice = choice;
      _updateStory();
    });
  }

  void _updateStory() {
    switch (_choice) {
      case 1:
        _storyText = 'Rabi entra en la cueva y se pierde.\n\n¿Qué debería hacer ahora?\n1. Seguir explorando.\n2. Llamar a sus amigos para pedir ayuda.';
        _imagePath = 'images/raby1.jpg';
        break;
      case 2:
        _storyText = 'Rabi vuelve a casa y prepara una exploración segura con sus amigos. Al llegar a la cueva:\n\n¿Qué deberían hacer?\n1. Dividirse.\n2. Mantenerse juntos.';
        _imagePath = 'images/raby2.jpg';
        break;
      case 3:
        _storyText = 'Rabi sigue explorando y se adentra más en la cueva, sintiéndose cada vez más perdido.';
        _imagePath = 'images/raby1.jpg';
        break;
      case 4:
        _storyText = 'Rabi llama a sus amigos, quienes lo encuentran y lo rescatan. Rabi aprende la importancia de escuchar consejos y tomar decisiones cuidadosas.';
        _imagePath = 'images/raby4.jpg';
        break;
      case 5:
        _storyText = 'Rabi y sus amigos se dividen y se sienten inseguros, decidiendo finalmente mantenerse juntos.';
        _imagePath = 'images/raby1.jpg';
        break;
      case 6:
        _storyText = 'Rabi y sus amigos se mantienen juntos y exploran la cueva con éxito. Rabi aprende la importancia de estar preparado y trabajar en equipo.';
        _imagePath = 'images/raby5.jpg';
        break;
      default:
        _storyText = 'Rabi, el conejo curioso, encuentra una cueva misteriosa cerca del río Brillante. Sus amigos, Tina y Sabio, le advierten sobre los peligros.';
        _imagePath = 'images/raby5.jpg';
    }
  }

  List<Widget> _getChoices() {
    switch (_choice) {
      case 0:
        return [
          ElevatedButton(
            onPressed: () => _makeChoice(1),
            child: const Text('Entrar en la cueva'),
          ),
          ElevatedButton(
            onPressed: () => _makeChoice(2),
            child: const Text('Escuchar a sus amigos y preparar una exploración segura'),
          ),
        ];
      case 1:
        return [
          ElevatedButton(
            onPressed: () => _makeChoice(3),
            child: const Text('Seguir explorando'),
          ),
          ElevatedButton(
            onPressed: () => _makeChoice(4),
            child: const Text('Llamar a sus amigos para pedir ayuda'),
          ),
        ];
      case 2:
        return [
          ElevatedButton(
            onPressed: () => _makeChoice(5),
            child: const Text('Dividirse'),
          ),
          ElevatedButton(
            onPressed: () => _makeChoice(6),
            child: const Text('Mantenerse juntos'),
          ),
        ];
      default:
        return [
          ElevatedButton(
            onPressed: () => _makeChoice(0),
            child: const Text('Empezar de nuevo'),
          ),
        ];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('La Aventura de Rabi'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                children: [
                  Image.asset(_imagePath, height: 300, fit: BoxFit.contain),
                  const SizedBox(height: 16),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Text(
                        _storyText,
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: _getChoices(),
            ),
          ],
        ),
      ),
    );
  }
}
