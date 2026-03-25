import 'package:flutter/material.dart';

class PortfolioSectionHeading extends StatelessWidget {
  const PortfolioSectionHeading({
    super.key,
    required this.title,
    required this.gradientColors,
  });

  final String title;
  final List<Color> gradientColors;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 700;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: isMobile ? 28 : 40,
                fontWeight: FontWeight.w900,
                letterSpacing: -0.4,
                color: Colors.white,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 12, bottom: isMobile ? 28 : 50),
              height: 3,
              width: isMobile ? 56 : 72,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(colors: gradientColors),
              ),
            ),
          ],
        );
      },
    );
  }
}
