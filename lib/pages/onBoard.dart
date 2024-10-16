import 'package:flutter/material.dart';
import 'package:pro/intro_pages/intro_page1.dart';
import 'package:pro/intro_pages/intro_page2.dart';
import 'package:pro/intro_pages/intro_page3.dart';
import 'package:pro/services/Auth/auth_get.dart';
import 'package:pro/theme/themeProvider.dart'; // Import your Theme provider
import 'package:provider/provider.dart'; // Import the provider package
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardPage extends StatefulWidget {
  const OnboardPage({super.key});

  @override
  State<OnboardPage> createState() => _OnboardPageState();
}

class _OnboardPageState extends State<OnboardPage> {
  // Controller to keep the page status
  final PageController _controller = PageController();
  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    // Get the ThemeProvider to access toggleTheme
    final themeProvider = Provider.of<Themeprovider>(context);

    return Scaffold(
      body: Stack(
        children: [
          // Page view
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                isLastPage = (index == 2);
              });
            },
            children: const [
              IntroPage1(),
              IntroPage2(),
              IntroPage3(),
            ],
          ),
          Container(
            alignment: const Alignment(0, 0.75),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Skip
                GestureDetector(
                  onTap: () {
                    _controller.jumpToPage(2);
                  },
                  child: const Text(
                    "Skip",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                // Dot indicator
                SmoothPageIndicator(
                  controller: _controller,
                  count: 3,
                ),
                // Next or Done
                isLastPage
                    ? GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return AuthGet(
                                    toggleTheme: themeProvider
                                        .toggleTheme); // Pass toggleTheme
                              },
                            ),
                          );
                        },
                        child: const Text(
                          "Done",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          _controller.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeIn,
                          );
                        },
                        child: const Text(
                          "Next",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
