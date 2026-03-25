import 'dart:ui';

class CompanyApp {
  CompanyApp({
    required this.title,
    required this.subtitle,
    required this.description,
    required this.link,
    required this.gradient,
  });

  final String title;
  final String subtitle;
  final String description;
  final String link;
  final List<Color> gradient;
}
