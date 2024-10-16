// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class IntroPage2 extends StatefulWidget {
  const IntroPage2({super.key});

  @override
  _IntroPage2State createState() => _IntroPage2State();
}

class _IntroPage2State extends State<IntroPage2>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _textSlideAnimation;
  late Animation<double> _imageHoverAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize Animation Controller
    _controller = AnimationController(
      duration: const Duration(seconds: 2), // Animation duration
      vsync: this,
    );

    // Slide animation for the text (from right to left at the top)
    _textSlideAnimation = Tween<Offset>(
      begin: const Offset(1, 0), // Start position (off the right edge)
      end: Offset.zero, // End position (normal)
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    // Hover animation for the image (slight scale effect)
    _imageHoverAnimation = Tween<double>(
      begin: 1.0, // Original size
      end: 1.05, // Slightly larger size to simulate hover
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    // Start the animations
    _controller.forward();
  }

  @override
  void dispose() {
    // Dispose the controller to avoid memory leaks
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Stack(
        children: [
          // Static Image with hover effect
          AnimatedBuilder(
            animation: _imageHoverAnimation,
            builder: (context, child) {
              return Center(
                child: Transform.scale(
                  scale: _imageHoverAnimation.value,
                  child: SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                    child: Image.asset(
                      'assets/img/intro_img_1.webp', // Image path
                      fit: BoxFit.cover, // Make the image cover the full screen
                    ),
                  ),
                ),
              );
            },
          ),
          // Text with Slide-In Effect from the right to the top
          Positioned(
            top: 50, // Position the text towards the top
            left: 0,
            right: 0,
            child: SlideTransition(
              position: _textSlideAnimation,
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  "Ethiopian Space Science and Geospatial Institute",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
