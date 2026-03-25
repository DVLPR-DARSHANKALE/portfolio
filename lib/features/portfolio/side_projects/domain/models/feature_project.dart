import 'package:flutter/material.dart';

class FeatureProject {
  const FeatureProject({
    required this.title,
    required this.description,
    required this.tech,
    required this.link,
    required this.icon,
  });

  final String title;
  final String description;
  final String tech;
  final String link;
  final IconData icon;
}
