import "package:flutter/material.dart";
import "constants.dart";

class IconContent extends StatelessWidget {
  const IconContent({
    super.key,
    required this.cardIcon,
    required this.cardText,
  });

  final IconData cardIcon;
  final String cardText;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(cardIcon, size: 105.0, color: Colors.white),
        const SizedBox(height: 10.0),
        Text(
          cardText,
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}
