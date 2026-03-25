import 'package:flutter/material.dart';
import 'package:portfolio/features/portfolio/side_projects/domain/models/feature_project.dart';

const List<FeatureProject> featureProjects = [
  FeatureProject(
    title: 'Clean Flutter BLoC Feature',
    description:
        'A VS Code extension that generates clean BLoC feature templates for Flutter, reducing boilerplate and enforcing scalable architecture.',
    tech: 'JavaScript | VS Code API',
    link:
        'https://open-vsx.org/extension/samarth/clean-flutter-bloc-feature',
    icon: Icons.extension,
  ),
  FeatureProject(
    title: 'Darshan GetX Generator',
    description:
        'A VS Code extension that generates GetX-ready Flutter feature scaffolding to speed up module setup and keep project structure consistent.',
    tech: 'JavaScript | VS Code API | GetX',
    link:
        'https://marketplace.visualstudio.com/items?itemName=darshan-dev.darshan-getx-generator',
    icon: Icons.extension,
  ),
];
