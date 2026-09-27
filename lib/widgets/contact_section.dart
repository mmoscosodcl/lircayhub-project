import 'package:flutter/material.dart';
import '../models/profile_model.dart';

class ContactSection extends StatelessWidget {
  final ContactConfig contact;
  final Color primaryColor;
  final bool isDark;

  const ContactSection({
    super.key,
    required this.contact,
    required this.primaryColor,
    required this.isDark,
  });

  IconData _getSocialIcon(String icon) {
    switch (icon) {
      case 'mail':
      case 'email':
        return Icons.mail;
      case 'link':
      case 'linkedin':
        return Icons.link;
      case 'alternate_email':
      case 'twitter':
        return Icons.alternate_email;
      default:
        return Icons.help_outline;
    }
  }

  @override
  Widget build(BuildContext context) {
    final circleBg = isDark ? const Color(0xFF232F48) : const Color(0xFFF5F5F5);

    return Column(
      children: [
        Text(
          contact.headline,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          contact.subHeadline,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14,
            color: isDark ? const Color(0xFF92A4C9) : const Color(0xFF757575),
          ),
        ),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: contact.socialLinks.map((link) {
            final iconData = _getSocialIcon(link.icon);
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(24),
                child: CircleAvatar(
                  radius: 24,
                  backgroundColor: circleBg,
                  child: Icon(
                    iconData,
                    color: primaryColor,
                    size: 20,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
