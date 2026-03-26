import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:portfolio/widgets/image_gallery_dialog.dart';
import 'package:portfolio/models/gallery_image.dart';

class PortfolioHomePage extends StatelessWidget {
  PortfolioHomePage({super.key});

  // Replace with your own gallery images (local assets or network URLs)
  final List<GalleryImage> galleryImages = [
    GalleryImage(url: 'https://picsum.photos/id/1/200/300', title: 'Image 1'),
    GalleryImage(url: 'https://picsum.photos/id/10/200/300', title: 'Image 2'),
    GalleryImage(url: 'https://picsum.photos/id/100/200/300', title: 'Image 3'),
    GalleryImage(url: 'https://picsum.photos/id/101/200/300', title: 'Image 4'),
    GalleryImage(url: 'https://picsum.photos/id/102/200/300', title: 'Image 5'),
    GalleryImage(url: 'https://picsum.photos/id/103/200/300', title: 'Image 6'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aaron Clevette'),
        centerTitle: false,
        elevation: 2,
        backgroundColor: Colors.white,
        foregroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1200),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header (profile picture, name, location/phone)
                  const SizedBox(height: 40),
                  Center(
                    child: SizedBox(
                      height: 300,
                      width: 300,
                      child: Image.asset(
                        "assets/images/me.jpg",
                        alignment: AlignmentGeometry.topCenter,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Center(
                    child: Text(
                      'Aaron Clevette',
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Center(
                    child: Text(
                      'Huntsville, Alabama • (817) 863-1326',
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  ),
                  const SizedBox(height: 40),

                  // Professional Summary
                  const Text(
                    'Professional Summary',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Highly adaptable IT professional with over 4 years of experience specializing in hardware '
                    'troubleshooting, infrastructure maintenance, and production software environments. '
                    'Distinguished by a strong ability to learn new things quickly, having successfully '
                    'transitioned across diverse technical and industrial roles by mastering new tools and '
                    'complex workflows on the job. Committed to maintaining high standards of operational '
                    'reliability and documenting reproducible processes while strictly adhering to industrial '
                    'safety protocols.',
                    style: TextStyle(fontSize: 16, height: 1.5),
                  ),
                  const SizedBox(height: 48),

                  // Education & Certifications (two columns)
                  const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Education',
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.w600),
                            ),
                            SizedBox(height: 12),
                            Text(
                              'Coppell High School',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                            Text('Graduated 2014'),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Certifications',
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.w600),
                            ),
                            SizedBox(height: 12),
                            Text('• OSHA Certification – Texas'),
                            Text('• UI/UX Certification – ELVTR'),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 48),

                  // Technical Skills
                  const Text(
                    'Technical Skills',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    children: [
                      _buildSkillChip('Linux'),
                      _buildSkillChip('Nginx'),
                      _buildSkillChip('Node.js'),
                      _buildSkillChip('JSON APIs'),
                      _buildSkillChip('Appwrite'),
                      _buildSkillChip('Dart'),
                      _buildSkillChip('Lua'),
                      _buildSkillChip('C#'),
                      _buildSkillChip('.NET'),
                      _buildSkillChip('Hardware Troubleshooting'),
                      _buildSkillChip('Forklift Operation'),
                      _buildSkillChip('OSHA Certified'),
                      _buildSkillChip('QA & Documentation'),
                      _buildSkillChip('Sprint Planning'),
                      _buildSkillChip('Confluence'),
                      _buildSkillChip('Slack'),
                    ],
                  ),
                  const SizedBox(height: 48),

                  // Professional Experience
                  const Text(
                    'Professional Experience',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 24),
                  Column(
                    children: [
                      _buildExperienceCard(
                        title: 'Quality Assurance & Documentation Contractor',
                        company: 'ProtoComplete',
                        date: '2024 (Contract)',
                        description: [
                          'Conducted rigorous QA testing and intentional stress testing to identify edge-case bugs and verify system stability.',
                          'Developed detailed, reproducible bug reports and technical documentation, including the official user manual.',
                          'Partnered directly with developers to validate fixes and confirm overall system integrity.',
                        ],
                      ),
                      const SizedBox(height: 24),
                      _buildExperienceCard(
                        title: 'Software Engineer / UI-UX Developer',
                        company: 'DBL (Developer Business Logistics)',
                        date: 'Oct 2022 – Present',
                        description: [
                          'Managed backend services and infrastructure tools including Node.js, Nginx, JSON APIs, and Appwrite.',
                          'Collaborated on technical design and system architecture within a high-stakes team environment.',
                          'Troubleshot critical application issues to ensure stable and robust software deployments.',
                          'Coordinated daily with distributed engineering teams using Slack and shared documentation tools.',
                          'https://developerbiz.com/',
                        ],
                      ),
                      const SizedBox(height: 24),
                      _buildExperienceCard(
                        title: 'Driver',
                        company: 'Uber',
                        date: 'Jan 2018 – Apr 2023',
                        description: [
                          'Maintained a consistent record of reliability and safety while navigating real-time logistics.',
                          'Applied high levels of emotional intelligence to provide professional service to a diverse client base.',
                        ],
                      ),
                      const SizedBox(height: 24),
                      _buildExperienceCard(
                        title: 'Finishing Center Associate',
                        company: 'Kömmerling USA',
                        date: 'Jul 2020 – Dec 2020',
                        description: [
                          'Operated forklifts and heavy machinery to handle and distribute materials in a warehouse environment.',
                          'Maintained strict adherence to safety procedures during packaging and shipment preparation.',
                          'Managed organized inventory areas and assisted with logistics operations.',
                        ],
                      ),
                      const SizedBox(height: 24),
                      _buildExperienceCard(
                        title: 'Server',
                        company: 'Rosie’s Mexican Cantina',
                        date: 'Jun 2019 – Jan 2020',
                        description: [
                          'Managed personal financial resources and supplies to ensure smooth service operations.',
                          'Honed customer service skills in a high-pressure, fast-paced service environment.',
                        ],
                      ),
                      const SizedBox(height: 24),
                      _buildExperienceCard(
                        title: 'Sales / Customer Relations',
                        company: 'Fry’s Electronics',
                        date: 'Aug 2018 – Dec 2019',
                        description: [
                          'Mastered complex technical product information to assist customers with hardware selections.',
                          'Developed proactive communication and sales strategies to meet performance-based targets.',
                          'Practiced observational skills to anticipate customer needs and provide timely assistance.',
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 48),

                  // Projects & Technical Interests (with clickable links)
                  const Text(
                    'Projects & Technical Interests',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 24),
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount:
                        MediaQuery.of(context).size.width < 800 ? 1 : 3,
                    crossAxisSpacing: 24,
                    mainAxisSpacing: 24,
                    childAspectRatio: 1.2,
                    children: [
                      _buildProjectCard(
                        title: 'OpenNetBattle',
                        description:
                            'Fan-engine project focused on custom server configuration and network optimizations to improve latency and stability. Utilized Lua scripting for engine enhancements and custom mods. I am a member of team FrameSkip.\nhttps://onb.frameskip.net/',
                        icon: Icons.sports_esports,
                        url: 'https://onb.frameskip.net/',
                      ),
                      _buildProjectCard(
                        title: 'Shanghai Genso Network',
                        description:
                            'Contributor implementing code using C# and .NET technologies for network-based projects.',
                        icon: Icons.network_locked,
                        url: null,
                      ),
                      _buildProjectCard(
                        title: 'Hardware & Systems',
                        description:
                            'Strong personal interest in emerging hardware trends, networking architecture, and software systems.',
                        icon: Icons.computer,
                        url: null,
                      ),
                      _buildProjectCard(
                        title: 'C2Report : DBL',
                        description:
                            'Sadly is currently in a WIP state for an undeterminant amount of time. We planned, designed and programmed a website and application for IOS and Android mobile platforms.\nhttps://www.c2report.com/',
                        icon: Icons.car_repair,
                        url: 'https://www.c2report.com/',
                      ),
                      // _buildProjectCard(
                      //   title: 'Extra Photos',
                      //   description:
                      //       "A collection of photographs from my previous projects with various steps of the design and implementations process.\nhttps://drive.google.com/drive/folders/1rSCYDZLkiETivHi4NbW0jG2gsGgpAfjR?usp=sharing",
                      //   icon: Icons.photo,
                      //   url:
                      //       'https://drive.google.com/drive/folders/1rSCYDZLkiETivHi4NbW0jG2gsGgpAfjR?usp=sharing',
                      // ),
                    ],
                  ),
                  const SizedBox(height: 48),

                  // Gallery section (new)
                  const Text(
                    'Gallery',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 16),
                  Center(
                    child: ElevatedButton.icon(
                      onPressed: () =>
                          ImageGalleryDialog.show(context, galleryImages),
                      icon: const Icon(Icons.photo_library),
                      label: const Text('View My Gallery'),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 12),
                      ),
                    ),
                  ),
                  const SizedBox(height: 48),

                  // Contact (original simple footer)
                  const Divider(),
                  const SizedBox(height: 16),
                  const Center(
                    child: Column(
                      children: [
                        Text(
                          'Contact Me',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: 8),
                        Text('(817) 863-1326'),
                        Text('aaronclevette@gmail.com'),
                        SizedBox(height: 8),
                        Text(
                            "(For my references and portfolio of my work please reach out through email!)"),
                        SizedBox(height: 8),
                        Text('Aaron Clevette'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Helper widgets (copied from your original main.dart)
  Widget _buildSkillChip(String label) {
    return Chip(
      label: Text(label),
      backgroundColor: Colors.blue.shade50,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    );
  }

  Widget _buildExperienceCard({
    required String title,
    required String company,
    required String date,
    required List<String> description,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              company,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            Text(
              date,
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 12),
            ...description.map(
              (point) => Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('• ', style: TextStyle(fontSize: 16)),
                    Expanded(
                        child: SelectableText(point,
                            style: const TextStyle(fontSize: 14))),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProjectCard({
    required String title,
    required String description,
    required IconData icon,
    String? url,
    List<String>? assets,
  }) {
    final card = Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 48, color: Colors.blue),
            const SizedBox(height: 16),
            Text(
              title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            Text(
              description,
              style: const TextStyle(fontSize: 14),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );

    if (url != null) {
      return InkWell(
        onTap: () => _launchURL(url),
        borderRadius: BorderRadius.circular(16),
        child: card,
      );
    }
    // assets parameter is not used in the original; kept for possible future use
    return card;
  }

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }
}
