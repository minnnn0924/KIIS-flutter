import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
import 'package:url_launcher/url_launcher.dart'; // 추가

class PassportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        title: Text(
          'passport-2'.i18n(),
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
            _headerText('passport-3'.i18n()),

            _sectionCard(
              title: 'passport-3'.i18n(),
              children: [
                _subSection('passport-4'.i18n()),
                _subSection('passport-5'.i18n()),
              ],
            ),

            _sectionCard(
              title: 'passport-6'.i18n(),
              children: [
                _subSection('passport-7'.i18n()),
                _subSection('passport-8'.i18n()),
                _subSection('passport-9'.i18n()),
                _subSection('passport-10'.i18n()),
                _subSection('passport-11'.i18n()),
                _subSection('passport-12'.i18n()),
              ],
            ),

            _sectionCard(
              title: 'passport-13'.i18n(),
              children: [
                _subSection('passport-14'.i18n()),
                _subSection('passport-15'.i18n()),
                _subSection('passport-16'.i18n()),
                _subSection('passport-17'.i18n()),
                _subSection('passport-18'.i18n()),
              ],
            ),

            _sectionCard(
              title: 'passport-19'.i18n(),
              children: [
                _subSection('passport-20'.i18n()),
                _subSection('passport-21'.i18n()),
                _subSection('passport-22'.i18n()),
                _subSection('passport-23'.i18n()),
                _subSection('passport-24'.i18n()),
                _subSection('passport-25'.i18n()),
                _subSection('passport-26'.i18n()),
                _subSection('passport-27'.i18n()),
              ],
            ),

            _sectionCard(
              title: 'passport-28'.i18n(),
              children: [
                _subSection('passport-29'.i18n()),
                _subSection('passport-30'.i18n()),
                _subSection('passport-31'.i18n()),
                _subSection('passport-32'.i18n()),
              ],
            ),

            _sectionCard(
              title: 'passport-33'.i18n(),
              children: [
                _linkItem('passport-34'.i18n(), 'https://www.mofa.go.jp'),
                _linkItem('passport-35'.i18n(), 'https://www.moj.go.jp'),
                _linkItem('passport-37'.i18n(), 'https://www.support-info.jp'),
              ],
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _headerText(String text) => Center(
    child: Text(
      text,
      style: const TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w900,
        color: Colors.indigo,
        decoration: TextDecoration.underline,
      ),
    ),
  );

  Widget _sectionCard({
    required String title,
    String? body,
    List<Widget>? children,
  }) {
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
              Text(body, style: const TextStyle(fontSize: 18)),
            ],
            if (children != null) ...children,
          ],
        ),
      ),
    );
  }

  Widget _subSection(String content) => Padding(
    padding: const EdgeInsets.only(top: 12, left: 4),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('• ', style: TextStyle(fontSize: 18, color: Colors.deepOrange)),
        Expanded(
          child: Text(
            content,
            style: const TextStyle(fontSize: 17, color: Colors.black87),
          ),
        ),
      ],
    ),
  );

  Widget _linkItem(String label, String url) => Padding(
    padding: const EdgeInsets.only(top: 12, left: 4),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('• ', style: TextStyle(fontSize: 18, color: Colors.deepOrange)),
        Expanded(
          child: GestureDetector(
            onTap: () async {
              final uri = Uri.parse(url);
              if (await canLaunchUrl(uri)) {
                await launchUrl(uri, mode: LaunchMode.externalApplication);
              }
            },
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 17,
                color: Colors.blue,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}