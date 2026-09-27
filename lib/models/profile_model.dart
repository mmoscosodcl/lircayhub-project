class MetaConfig {
  final String appTitle;
  final String themeColor;

  MetaConfig({
    required this.appTitle,
    required this.themeColor,
  });

  factory MetaConfig.fromJson(Map<String, dynamic> json) {
    return MetaConfig(
      appTitle: json['appTitle'] as String? ?? 'Portfolio',
      themeColor: json['themeColor'] as String? ?? '#135bec',
    );
  }
}

class HeroConfig {
  final String title;
  final String subtitle;
  final String actionButtonText;

  HeroConfig({
    required this.title,
    required this.subtitle,
    required this.actionButtonText,
  });

  factory HeroConfig.fromJson(Map<String, dynamic> json) {
    return HeroConfig(
      title: json['title'] as String? ?? '',
      subtitle: json['subtitle'] as String? ?? '',
      actionButtonText: json['actionButtonText'] as String? ?? 'Ver mi Impacto',
    );
  }
}

class PersonalConfig {
  final String name;
  final String role;
  final String location;
  final String bio;
  final String? avatarUrl;
  final String? resumeLink;

  PersonalConfig({
    required this.name,
    required this.role,
    required this.location,
    required this.bio,
    this.avatarUrl,
    this.resumeLink,
  });

  factory PersonalConfig.fromJson(Map<String, dynamic> json) {
    return PersonalConfig(
      name: json['name'] as String? ?? '',
      role: json['role'] as String? ?? '',
      location: json['location'] as String? ?? '',
      bio: json['bio'] as String? ?? '',
      avatarUrl: json['avatarUrl'] as String?,
      resumeLink: json['resumeLink'] as String?,
    );
  }
}

class ExperienceItem {
  final String id;
  final String title;
  final String company;
  final String period;
  final String? description;
  final String type;

  ExperienceItem({
    required this.id,
    required this.title,
    required this.company,
    required this.period,
    this.description,
    required this.type,
  });

  factory ExperienceItem.fromJson(Map<String, dynamic> json) {
    return ExperienceItem(
      id: json['id'] as String? ?? '',
      title: json['title'] as String? ?? '',
      company: json['company'] as String? ?? '',
      period: json['period'] as String? ?? '',
      description: json['description'] as String?,
      type: json['type'] as String? ?? 'work',
    );
  }
}

class ProjectItem {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final String? link;
  final List<String> tags;

  ProjectItem({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    this.link,
    required this.tags,
  });

  factory ProjectItem.fromJson(Map<String, dynamic> json) {
    return ProjectItem(
      id: json['id'] as String? ?? '',
      title: json['title'] as String? ?? '',
      description: json['description'] as String? ?? '',
      imageUrl: json['imageUrl'] as String? ?? '',
      link: json['link'] as String?,
      tags: (json['tags'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
    );
  }
}

class SocialLink {
  final String platform;
  final String url;
  final String icon;

  SocialLink({
    required this.platform,
    required this.url,
    required this.icon,
  });

  factory SocialLink.fromJson(Map<String, dynamic> json) {
    return SocialLink(
      platform: json['platform'] as String? ?? '',
      url: json['url'] as String? ?? '',
      icon: json['icon'] as String? ?? 'link',
    );
  }
}

class ContactConfig {
  final String headline;
  final String subHeadline;
  final List<SocialLink> socialLinks;

  ContactConfig({
    required this.headline,
    required this.subHeadline,
    required this.socialLinks,
  });

  factory ContactConfig.fromJson(Map<String, dynamic> json) {
    return ContactConfig(
      headline: json['headline'] as String? ?? 'Conectemos',
      subHeadline: json['subHeadline'] as String? ?? '',
      socialLinks: (json['socialLinks'] as List<dynamic>?)
              ?.map((e) => SocialLink.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }
}

class ProfileData {
  final MetaConfig meta;
  final HeroConfig hero;
  final PersonalConfig personal;
  final List<ExperienceItem> experience;
  final List<ProjectItem> projects;
  final ContactConfig contact;

  ProfileData({
    required this.meta,
    required this.hero,
    required this.personal,
    required this.experience,
    required this.projects,
    required this.contact,
  });

  factory ProfileData.fromJson(Map<String, dynamic> json) {
    return ProfileData(
      meta: MetaConfig.fromJson(json['meta'] as Map<String, dynamic>? ?? {}),
      hero: HeroConfig.fromJson(json['hero'] as Map<String, dynamic>? ?? {}),
      personal: PersonalConfig.fromJson(
          json['personal'] as Map<String, dynamic>? ?? {}),
      experience: (json['experience'] as List<dynamic>?)
              ?.map((e) => ExperienceItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      projects: (json['projects'] as List<dynamic>?)
              ?.map((e) => ProjectItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      contact: ContactConfig.fromJson(
          json['contact'] as Map<String, dynamic>? ?? {}),
    );
  }
}
