import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
import 'package:url_launcher/url_launcher.dart';

class DlScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        title: Text(
          'license-2'.i18n(),
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        elevation: 6,
        shadowColor: Colors.black45,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeaderText("license-1".i18n()),
            const SizedBox(height: 28),

            _sectionCard(
              title: "license-t".i18n(),
            ),

            _sectionCard(
              title: "license-3".i18n(),
              body: "license-4".i18n(),
            ),

            _sectionCard(
              title: "license-5".i18n(),
              body: "license-6".i18n(),
            ),

            _sectionCard(
              title: "license-7".i18n(),
              body: "license-8".i18n(),
            ),

            _sectionCard(
              title: "license-9".i18n(),
              body: "license-10".i18n(),
            ),

            _sectionCard(
              title: "license-11".i18n(),
              children: [
                _subSection("license-12".i18n(), "license-13".i18n()),
                _subSection("license-14".i18n(), "license-15".i18n()),
                const SizedBox(height: 12),
                GestureDetector(
                  onTap: () async {
                    final url = Uri.parse('https://menkyo-click.com/school/');
                    if (await canLaunchUrl(url)) {
                      await launchUrl(url, mode: LaunchMode.externalApplication);
                    } else {
                      // 열 수 없을 경우 메시지를 보여줌
                      debugPrint('URL을 열 수 없습니다: $url');
                    }
                  },
                  child: Text(
                    "license-20".i18n(),
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),

            _sectionCard(
              title: "license-16".i18n(),
              body: "license-17".i18n(),
            ),

            _sectionCard(
              title: "license-18".i18n(),
              body: "license-19".i18n(),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderText(String title) {
    return Center(
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 34,
          fontWeight: FontWeight.w900,
          color: Colors.indigo,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }

  Widget _sectionCard({required String title, String? body, List<Widget>? children}) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            if (body != null && body.isNotEmpty) ...[
              const SizedBox(height: 12),
              Text(
                body,
                style: const TextStyle(fontSize: 18, color: Colors.black87),
              ),
            ],
            if (children != null) ...children,
          ],
        ),
      ),
    );
  }
  Widget _subSection(String title, [String? content]) {
    return Padding(
      padding: const EdgeInsets.only(top: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: Colors.deepOrange,
            ),
          ),
          if (content != null && content.isNotEmpty) ...[
            const SizedBox(height: 8),
            Text(
              content,
              style: const TextStyle(fontSize: 17, color: Colors.black87),
            ),
          ]
        ],
      ),
    );
  }

  Widget _imageRow(String leftImage, String rightImage) {
    return Column(
      children: [
        const SizedBox(height: 40),
        Row(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  leftImage,
                  fit: BoxFit.contain,
                  height: 180,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  rightImage,
                  fit: BoxFit.contain,
                  height: 180,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
