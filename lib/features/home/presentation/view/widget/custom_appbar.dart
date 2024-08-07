import 'package:bookly_app/core/utlis/app_router.dart';
import 'package:bookly_app/core/utlis/assets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          AssetsData.logo,
          height: 18,
        ),
        const Spacer(),
        IconButton(
          onPressed: () {
            GoRouter.of(context).push(AppRouters.kSerachView);
          },
          icon: const Icon(
            FontAwesomeIcons.magnifyingGlass,
            size: 22,
          ),
        ),
      ],
    );
  }
}
