import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../core/uitels/app_images.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.end,
        //   children: [
        //     SvgPicture.asset(Assets.imagesLeaves),
        //   ],
        // ),
        Image.asset(Assets.imagesLogo),
        // SvgPicture.asset(
        //   Assets.imagesCircles,
        //   fit: BoxFit.fill,
        // ),
      ],
    );
  }
}
