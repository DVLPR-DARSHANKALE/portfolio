import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio/features/portfolio/side_projects/domain/models/feature_project.dart';
import 'package:url_launcher/url_launcher.dart';

class FeatureProjectCard extends StatelessWidget {
  const FeatureProjectCard({super.key, required this.project});

  final FeatureProject project;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 700;
        final padding = isMobile ? 18.0 : 26.0;

        return Container(
          margin: EdgeInsets.only(bottom: isMobile ? 20 : 32),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(isMobile ? 22 : 26),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
              child: Container(
                padding: EdgeInsets.all(padding),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.08),
                  borderRadius: BorderRadius.circular(isMobile ? 22 : 26),
                  border: Border.all(color: Colors.white.withOpacity(0.15)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: 12,
                      runSpacing: 12,
                      children: [
                        Icon(
                          project.icon,
                          color: Colors.cyanAccent,
                          size: isMobile ? 24 : 28,
                        ),
                        Text(
                          project.title,
                          style: TextStyle(
                            fontSize: isMobile ? 20 : 24,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 14),
                    Text(
                      project.description,
                      style: TextStyle(
                        fontSize: isMobile ? 14 : 16,
                        color: Colors.white70,
                        height: 1.6,
                      ),
                    ),
                    const SizedBox(height: 14),
                    Text(
                      project.tech,
                      style: TextStyle(
                        fontSize: isMobile ? 13 : 14,
                        color: Colors.white60,
                      ),
                    ),
                    const SizedBox(height: 22),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          launchUrl(
                            Uri.parse(project.link),
                            mode: LaunchMode.externalApplication,
                          );
                        },
                        child: const Text(
                          'View Project ->',
                          style: TextStyle(color: Colors.cyanAccent),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    ).animate().fadeIn(duration: 700.ms).slideY(begin: 0.15);
  }
}
