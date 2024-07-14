import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BakcgroundWidget extends StatelessWidget {
  final Widget child;
  const BakcgroundWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset(
          "assets/images/background.svg",
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        child
      ],
    );
  }
}
