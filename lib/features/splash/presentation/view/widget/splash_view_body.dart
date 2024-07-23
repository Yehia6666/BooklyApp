import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utlis/assets.dart';
import 'package:bookly_app/features/home/presentation/view/home_view.dart';
import 'package:bookly_app/features/splash/presentation/view/widget/sliding_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> sliderAnimation;

  @override
  void initState() {
    super.initState();
    initSlidingAnimation();

    navigateToHomeView();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(AssetsData.logo),
        const SizedBox(
          height: 4,
        ),
        SlidingText(sliderAnimation: sliderAnimation)
      ],
    );
  }

  void initSlidingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    sliderAnimation = Tween<Offset>(begin: const Offset(0, 7), end: Offset.zero)
        .animate(animationController);

    animationController.forward();
  }

  void navigateToHomeView() {
    Future.delayed(const Duration(seconds: 2), () {
      Get.to(() => const HomeView(),
          transition: Transition.fadeIn, duration: kTranstionDuration);
    });
  }
}
