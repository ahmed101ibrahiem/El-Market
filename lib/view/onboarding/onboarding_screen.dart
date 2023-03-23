import 'package:e_commerce/view/login/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../model/onboarding_model/onboarding.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();

  const OnboardingScreen({super.key});
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final List<OnboardingModel> _myData = [
    OnboardingModel(
      imageSvg: 'assets/svg/Add to Cart-rafiki.svg',
      textOnboarding:
      'Smasher Connection Between Students and Companies\n An Unparalleled Experience',
    ),
    OnboardingModel(
      imageSvg: 'assets/svg/Dropshipping model-rafiki.svg',
      textOnboarding:
      'Online Assesment \n aimed to Save time and effort  \n of Companies',
    ),
    OnboardingModel(
      imageSvg: 'assets/svg/Online Groceries-rafiki.svg',
      textOnboarding:
      'Online Training courses \n full of modern information and skill',
    ),
    OnboardingModel(
      imageSvg: 'assets/svg/Online shopping-rafiki.svg',
      textOnboarding: 'Supercalifragilisticexpialidocious\n Virtual 3d Events',
    ),
  ];

  bool isLast = false;
  var boardController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (isLast) {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => LogInScreen()));
            } else {
              boardController.nextPage(
                  duration: const Duration(milliseconds: 600),
                  curve: Curves.easeInSine);
            }
          },
          backgroundColor: Colors.green,
          child: const Icon(
            Icons.arrow_forward_ios_rounded,
            size: 40,
            color: Colors.white,
          ),
        ),
        // appBar: AppBar(backgroundColor: Colors.transparent),
        body: SafeArea(
          child: Stack(
            children: [
              PageView.builder(
                  controller: boardController,
                  physics: const BouncingScrollPhysics(),
                  itemCount: _myData.length,
                  onPageChanged: (int index) {
                    if (index == _myData.length - 1) {
                      setState(() {
                        isLast = true;
                      });
                    } else {
                      setState(() {
                        isLast = false;
                      });
                    }
                  },
                  itemBuilder: (context, index) {
                    return Stack(
                      children: [
                        Container(),
                        Align(
                          alignment: Alignment.topRight,
                          child: TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LogInScreen()));
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: const [
                                Text(
                                  'SKIP',
                                  style: TextStyle(color: Color(0xFF478d8b)),
                                ),
                                // ),
                                Icon(
                                  Icons.arrow_forward_ios_outlined,
                                  size: 12,
                                  color: Color(0xFF478d8b),
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Transform.translate(
                                    offset: const Offset(0, -30),
                                    child: SvgPicture.asset(
                                        _myData[index].imageSvg)),
                                const SizedBox(
                                  height: 16,
                                ),
                                Text(
                                  _myData[index].textOnboarding,
                                  style:
                                  const TextStyle(color: Color(0xFF707070)),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.1),
                                SmoothPageIndicator(
                                  controller: boardController,
                                  count: _myData.length,
                                  effect: const ScrollingDotsEffect(
                                      dotColor: Colors.grey,
                                      dotWidth: 10,
                                      dotHeight: 10,
                                      spacing: 12.0,
                                      activeDotColor: Color(0xFF478d8b)),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
            ],
          ),
        ));
  }
}
