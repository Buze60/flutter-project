import 'package:flutter/material.dart';
import 'package:pro/intro_pages/intro_page1.dart';
import 'package:pro/intro_pages/intro_page2.dart';
import 'package:pro/intro_pages/intro_page3.dart';
import 'package:pro/services/Auth/auth_get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardPage extends StatefulWidget {
  const OnboardPage({super.key});

  @override
  State<OnboardPage> createState() => _OnboardPageState();
}

class _OnboardPageState extends State<OnboardPage> {
  //controller to keep the page status
  final PageController _controller = PageController();
  bool isLastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        //page view
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
                //skip
                GestureDetector(
                  onTap: () {
                    _controller.jumpToPage(2);
                  },
                  child: const Text(
                    "Skip",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                //dot indicator
                SmoothPageIndicator(controller: _controller, count: 3),
                //next
                isLastPage
                    ? GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const AuthGet();
                          }));
                        },
                        child: const Text(
                          "Done",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      )
                    :
                    //Done
                    GestureDetector(
                        onTap: () {
                          _controller.nextPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeIn);
                        },
                        child: const Text(
                          "Next",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
              ],
            ))
      ],
    ));
  }
}
