import 'package:flutter/material.dart';
import 'package:localization/localization.dart';

class MScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        title: Text(
          'my-number-card'.i18n(),
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
            _buildHeaderText("my-number-card".i18n()),
            const SizedBox(height: 28),

            _sectionCard(
              title: "what-is-my-number-card?".i18n(),
              body: "my-number-card-description".i18n(),
            ),
            const SizedBox(height: 20),
            _imageRow('assets/M_omo.png', 'assets/M_ura.jpg'),

            _sectionCard(
              title: "how-to-apply-for-my-number-card".i18n(),
              body: "",
              children: [
                _subSection("Preparation-before-application".i18n(), "Preparation-before-application-text".i18n()),
                _subSection("card-application".i18n()),
                _subSection("an-application-by-mail".i18n(), "an-application-by-mail-text".i18n()),
                _subSection("Apply-online".i18n(), "Apply-online-text".i18n()),
                _subSection("Application-and-confirmation".i18n(), "Application-and-confirmation-text".i18n()),
                _subSection("Card-Receipt".i18n(), "Card-Receipt-text".i18n()),
              ],
            ),

            _sectionCard(
              title: "benefits-of-my-number-card".i18n(),
              children: [
                _subSection("Official-ID-role".i18n(), "Official-ID-role-text".i18n()),
                _subSection("Using-e-Government-Services".i18n(), "Using-e-Government-Services-text".i18n()),
                _subSection("Replacement-of-health-insurance-card".i18n(), "Replacement-of-health-insurance-card-text".i18n()),
              ],
            ),

            _sectionCard(
              title: "if-you-lost-your-my-number-card".i18n(),
              children: [
                _subSection("lost-my-number-card-steps".i18n(), "lost-my-number-card-steps-text".i18n()),
                _subSection("A-lost-report-to-a-nearby-police-station".i18n(), "A-lost-report-to-a-nearby-police-station-text".i18n()),
              ],
            ),
            const SizedBox(height: 30),
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
