import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const ChangeColorApp());
}

class ChangeColorApp extends StatelessWidget {
  const ChangeColorApp();

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ChangeColorScreen(),
    );
  }
}

class ChangeColorScreen extends StatefulWidget {
  const ChangeColorScreen();

  @override
  _ChangeColorScreenState createState() => _ChangeColorScreenState();
}

class _ChangeColorScreenState extends State<ChangeColorScreen> {
  Color _backgroundColor = Colors.white;
  final Random _random = Random();
  final int colorComponentMax = 256;
  bool _isAnimating = false;

  void _changeBackgroundColor() {
    if (_isAnimating) {
      return;
    }

    final newColor = Color.fromRGBO(
      _random.nextInt(colorComponentMax),
      _random.nextInt(colorComponentMax),
      _random.nextInt(colorComponentMax),
      1.0,
    );

    setState(() {
      _isAnimating = true;
    });

    _animateColorChange(newColor);
  }

  Future<void> _animateColorChange(Color newColor) async {
    await Future.delayed(const Duration(milliseconds: 500));

    setState(() {
      _backgroundColor = newColor;
      _isAnimating = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: _changeBackgroundColor,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          color: _backgroundColor,
          child: const Center(
            child: Text(
              'Hello there',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
