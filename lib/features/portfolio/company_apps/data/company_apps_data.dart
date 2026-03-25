import 'package:flutter/material.dart';
import 'package:portfolio/features/portfolio/company_apps/domain/models/company_app.dart';

final List<CompanyApp> companyApps = [
  CompanyApp(
    title: 'ReshimGathi',
    subtitle: 'Matrimony Platform',
    description:
        'Contributed to a large-scale matrimony platform built with Flutter, focusing on clean architecture, secure matchmaking flows, and verified user profiles. Worked closely on API integration, performance optimization, and ensuring a smooth, reliable user experience for a community-driven product used in production.',
    link:
        'https://play.google.com/store/apps/details?id=dev.probity.reshimgathi',
    gradient: [Colors.pinkAccent, Colors.deepPurple],
  ),
  CompanyApp(
    title: 'Ok Barter',
    subtitle: 'Marketplace Application',
    description:
        'Worked on a Flutter-based marketplace application that enables users to list, browse, and trade products seamlessly. Contributed to building responsive UI flows, integrating backend APIs, and improving overall performance to support secure interactions and smooth trading experiences.',
    link: 'https://play.google.com/store/apps/details?id=com.okbarter.app',
    gradient: [Colors.cyanAccent, Colors.blueAccent],
  ),
  CompanyApp(
    title: 'QuickGig',
    subtitle: 'Gig and Services Platform',
    description:
        'Contributed to the development of a gig-based service platform where users can discover, book, and manage on-demand services. Worked on implementing intuitive user flows, real-time interactions, and scalable Flutter UI components to support a fast and reliable service experience.',
    link: 'https://play.google.com/store/apps/details?id=com.quickgig.customer',
    gradient: [Colors.orangeAccent, Colors.deepOrange],
  ),
];
