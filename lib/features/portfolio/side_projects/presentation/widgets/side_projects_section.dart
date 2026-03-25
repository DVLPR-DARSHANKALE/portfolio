import 'package:flutter/material.dart';
import 'package:portfolio/features/portfolio/shared/presentation/widgets/portfolio_section_heading.dart';
import 'package:portfolio/features/portfolio/side_projects/data/feature_projects_data.dart';
import 'package:portfolio/features/portfolio/side_projects/presentation/widgets/feature_project_card.dart';

class SideProjectsSection extends StatelessWidget {
  const SideProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const PortfolioSectionHeading(
          title: 'Tools and Developer Utilities',
          gradientColors: [Colors.cyanAccent, Colors.pinkAccent],
        ),
        ...featureProjects.map(
          (project) => FeatureProjectCard(project: project),
        ),
      ],
    );
  }
}
