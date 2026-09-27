import 'package:flutter/material.dart';
import '../models/profile_model.dart';

class ExperienceSection extends StatelessWidget {
  final List<ExperienceItem> experience;
  final Color primaryColor;
  final bool isDark;

  const ExperienceSection({
    super.key,
    required this.experience,
    required this.primaryColor,
    required this.isDark,
  });

  IconData _getIconForType(String type) {
    switch (type) {
      case 'work':
        return Icons.work;
      case 'code':
        return Icons.code;
      case 'terminal':
        return Icons.terminal;
      default:
        return Icons.help_outline;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Experience',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: primaryColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  'CAREER',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
            ],
          ),
        ),
        ...List.generate(experience.length, (index) {
          final item = experience[index];
          final isWork = item.type == 'work';
          final icon = _getIconForType(item.type);
          final iconColor = isWork
              ? primaryColor
              : (isDark ? const Color(0xFFBDC6D8) : const Color(0xFF9E9E9E));
          final iconBg = isWork
              ? primaryColor.withValues(alpha: 0.1)
              : (isDark ? const Color(0xFF424242) : const Color(0xFFF5F5F5));
          final isLast = index == experience.length - 1;

          return IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: iconBg,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        icon,
                        color: iconColor,
                        size: 20,
                      ),
                    ),
                    if (!isLast)
                      Expanded(
                        child: Container(
                          width: 2,
                          margin: const EdgeInsets.symmetric(vertical: 4),
                          color: isDark
                              ? const Color(0xFF324467)
                              : const Color(0xFFEEEEEE),
                        ),
                      ),
                  ],
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.title,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          item.company,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: primaryColor,
                          ),
                        ),
                        Text(
                          item.period,
                          style: TextStyle(
                            fontSize: 12,
                            color: isDark
                                ? const Color(0xFF92A4C9)
                                : const Color(0xFF757575),
                          ),
                        ),
                        if (item.description != null &&
                            item.description!.isNotEmpty) ...[
                          const SizedBox(height: 8),
                          Text(
                            item.description!,
                            style: TextStyle(
                              fontSize: 14,
                              color: isDark
                                  ? const Color(0xFFBDC6D8)
                                  : const Color(0xFF616161),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ],
    );
  }
}
