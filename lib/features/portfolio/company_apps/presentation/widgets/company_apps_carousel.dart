import 'dart:async';

import 'package:flutter/material.dart';
import 'package:portfolio/features/portfolio/company_apps/data/company_apps_data.dart';
import 'package:portfolio/features/portfolio/company_apps/presentation/widgets/company_app_card.dart';
import 'package:portfolio/features/portfolio/shared/presentation/widgets/portfolio_section_heading.dart';

class CompanyAppsCarousel extends StatefulWidget {
  const CompanyAppsCarousel({super.key});

  @override
  State<CompanyAppsCarousel> createState() => _CompanyAppsCarouselState();
}

class _CompanyAppsCarouselState extends State<CompanyAppsCarousel> {
  late PageController controller;
  Timer? _timer;
  int _currentPage = 0;
  bool _isHovering = false;
  double _viewportFraction = 0.72;

  @override
  void initState() {
    super.initState();
    controller = PageController(viewportFraction: _viewportFraction);
    _startAutoScroll();
  }

  void _updateViewportFraction(double viewportFraction) {
    if ((_viewportFraction - viewportFraction).abs() < 0.01) {
      return;
    }

    _viewportFraction = viewportFraction;
    final previousController = controller;
    controller = PageController(
      viewportFraction: _viewportFraction,
      initialPage: _currentPage,
    );
    previousController.dispose();
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(const Duration(seconds: 2), (_) {
      if (_isHovering || !controller.hasClients) {
        return;
      }

      _currentPage = (_currentPage + 1) % companyApps.length;

      controller.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 900),
        curve: Curves.easeInOutCubicEmphasized,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 700;
        final horizontalPadding = isMobile ? 20.0 : 60.0;
        final carouselHeight = isMobile ? 320.0 : 360.0;
        final viewportFraction = isMobile ? 0.9 : 0.72;

        _updateViewportFraction(viewportFraction);

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding,
                vertical: isMobile ? 8 : 15,
              ),
              child: const PortfolioSectionHeading(
                title: 'Applications Built at Company',
                gradientColors: [Colors.pinkAccent, Colors.cyanAccent],
              ),
            ),
            SizedBox(
              height: carouselHeight,
              child: MouseRegion(
                onEnter: (_) => _isHovering = true,
                onExit: (_) => _isHovering = false,
                cursor: SystemMouseCursors.grab,
                child: PageView.builder(
                  controller: controller,
                  physics: const BouncingScrollPhysics(),
                  itemCount: companyApps.length,
                  itemBuilder: (context, index) {
                    return AnimatedBuilder(
                      animation: controller,
                      builder: (context, child) {
                        double value = 1.0;

                        if (controller.position.haveDimensions) {
                          value = controller.page! - index;
                          value = (1 - value.abs() * 0.28).clamp(0.82, 1.0);
                        }

                        return Transform.translate(
                          offset: Offset(0, (1 - value) * (isMobile ? 24 : 46)),
                          child: Transform.scale(
                            scale: value,
                            child: Opacity(
                              opacity: value,
                              child: child,
                            ),
                          ),
                        );
                      },
                      child: CompanyAppCard(app: companyApps[index]),
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: isMobile ? 12 : 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Text(
                '<- swipe or drag ->',
                style: TextStyle(
                  fontSize: isMobile ? 11 : 12,
                  color: Colors.white38,
                  letterSpacing: 1.2,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
