import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio/features/portfolio/company_apps/presentation/widgets/company_apps_carousel.dart';
import 'package:portfolio/features/portfolio/profile/presentation/widgets/name_card.dart';
import 'package:portfolio/features/portfolio/shared/presentation/widgets/animated_gradient_background.dart';
import 'package:portfolio/features/portfolio/side_projects/presentation/widgets/side_projects_section.dart';

class PortfolioScreen extends StatelessWidget {
  const PortfolioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const AnimatedGradientBackground(),
          SafeArea(
            child: LayoutBuilder(
              builder: (context, constraints) {
                final maxWidth = constraints.maxWidth;
                final isMobile = maxWidth < 700;
                final horizontalPadding = isMobile ? 20.0 : 60.0;
                final topPadding = isMobile ? 24.0 : 80.0;
                final sectionGap = isMobile ? 56.0 : 100.0;
                final contentWidth = maxWidth > 1200 ? 1200.0 : maxWidth;

                return SingleChildScrollView(
                  child: Center(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: contentWidth),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: horizontalPadding,
                              vertical: topPadding,
                            ),
                            child: const NameCard()
                                .animate()
                                .fadeIn(duration: 700.ms)
                                .slideY(begin: 0.12, curve: Curves.easeOut),
                          ),
                          SizedBox(height: sectionGap),
                          const CompanyAppsCarousel()
                              .animate()
                              .fadeIn(delay: 150.ms)
                              .slideY(begin: 0.1),
                          SizedBox(height: isMobile ? 72 : 120),
                          Padding(
                            padding: EdgeInsets.fromLTRB(
                              horizontalPadding,
                              0,
                              horizontalPadding,
                              isMobile ? 40 : 80,
                            ),
                            child: const SideProjectsSection()
                                .animate()
                                .fadeIn(delay: 250.ms)
                                .slideY(begin: 0.1),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
