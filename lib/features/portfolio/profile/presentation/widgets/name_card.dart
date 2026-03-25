import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio/features/portfolio/profile/presentation/widgets/info_chip.dart';
import 'package:url_launcher/url_launcher.dart';

class NameCard extends StatefulWidget {
  const NameCard({super.key});

  @override
  State<NameCard> createState() => _NameCardState();
}

class _NameCardState extends State<NameCard> {
  bool _hover = false;

  Future<void> _launchUri(Uri uri) async {
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  void _copyWithFeedback(String value, String message) {
    Clipboard.setData(ClipboardData(text: value));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 760;
        final cardPadding = isMobile ? 20.0 : 36.0;
        final avatarSize = isMobile ? 96.0 : 130.0;
        final headingSize = isMobile ? 32.0 : 46.0;
        final bodySize = isMobile ? 14.0 : 16.0;
        final borderRadius = isMobile ? 24.0 : 32.0;

        final profileImage = Align(
          alignment: isMobile ? Alignment.centerLeft : Alignment.center,
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.pinkAccent.withOpacity(_hover ? 0.7 : 0.55),
                  blurRadius: 46,
                ),
              ],
            ),
            child: ClipOval(
              child: Image.asset(
                'assets/images/profile_img.jpeg',
                width: avatarSize,
                height: avatarSize,
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              ),
            ),
          ).animate().scale(duration: 700.ms, curve: Curves.easeOutBack),
        );

        final profileContent = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Darshan Kale',
              style: TextStyle(
                fontSize: headingSize,
                fontWeight: FontWeight.w900,
                letterSpacing: -0.6,
                color: Colors.white,
              ),
            ).animate().fadeIn(delay: 150.ms).slideX(begin: -0.04),
            const SizedBox(height: 10),
            Wrap(
              spacing: 10,
              runSpacing: 8,
              children: const [
                InfoChip('Flutter Developer'),
                InfoChip('2+ Years Experience'),
                InfoChip('Production Apps'),
              ],
            ).animate().fadeIn(delay: 280.ms).slideY(begin: 0.15),
            const SizedBox(height: 16),
            _ContactRow(
              icon: Icons.email_outlined,
              text: 'dev.kaledarshan@gmail.com',
              onTap: () => _launchUri(
                Uri(
                  scheme: 'mailto',
                  path: 'dev.kaledarshan@gmail.com',
                ),
              ),
              onLongPress: () => _copyWithFeedback(
                'dev.kaledarshan@gmail.com',
                'Email copied',
              ),
            ),
            const SizedBox(height: 6),
            _ContactRow(
              icon: Icons.phone_outlined,
              text: '+91 9730165039',
              onTap: () => _launchUri(
                Uri(scheme: 'tel', path: '+919730165039'),
              ),
              onLongPress: () => _copyWithFeedback(
                '+919730165039',
                'Phone copied',
              ),
            ),
            const SizedBox(height: 18),
            Text(
              'Flutter Developer with 2+ years of experience building production-grade mobile applications. Currently working at Probity IT Services, contributing to scalable Flutter apps with clean architecture, REST APIs, Firebase, and modern state management.',
              style: TextStyle(
                color: Colors.white60,
                fontSize: bodySize,
                height: 1.65,
              ),
            ).animate().fadeIn(delay: 420.ms).slideY(begin: 0.12),
          ],
        );

        return MouseRegion(
          onEnter: (_) => setState(() => _hover = true),
          onExit: (_) => setState(() => _hover = false),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 280),
            curve: Curves.easeOut,
            transform: Matrix4.translationValues(0, _hover ? -6 : 0, 0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(borderRadius),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
                child: Container(
                  padding: EdgeInsets.all(cardPadding),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(borderRadius),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.white.withOpacity(_hover ? 0.18 : 0.15),
                        Colors.white.withOpacity(0.04),
                      ],
                    ),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.18),
                    ),
                  ),
                  child: isMobile
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            profileImage,
                            const SizedBox(height: 20),
                            profileContent,
                          ],
                        )
                      : Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            profileImage,
                            const SizedBox(width: 36),
                            Expanded(child: profileContent),
                          ],
                        ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _ContactRow extends StatelessWidget {
  const _ContactRow({
    required this.icon,
    required this.text,
    required this.onTap,
    required this.onLongPress,
  });

  final IconData icon;
  final String text;
  final VoidCallback onTap;
  final VoidCallback onLongPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      onLongPress: onLongPress,
      child: Row(
        children: [
          Icon(
            icon,
            size: 18,
            color: Colors.white70,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
