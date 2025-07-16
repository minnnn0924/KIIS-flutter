import 'package:flutter/material.dart';
import 'package:localization/localization.dart';

class HoukenScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        title: Text(
          'national-health-insurance'.i18n(),
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
            _buildHeaderText("1card-application".i18n()),
            const SizedBox(height: 28),

            _sectionCard(
              title: "1an-application-by-mail".i18n(),
              body: "1an-application-by-mail-text".i18n(),
            ),
            _sectionCard(
              title: "1Apply-online".i18n(),
              body: "1Apply-online-text".i18n(),
            ),
            _sectionCard(
              title: "1Application-and-confirmation".i18n(),
              body: "1Application-and-confirmation-text".i18n(),
            ),
            _sectionCard(
              title: "1Card-Receipt".i18n(),
              body: "1Card-Receipt-text".i18n(),
            ),

            _sectionCard(
              title: "1benefits-of-national-health-insurance".i18n(),
              children: [
                _subSection("1Official-ID-role".i18n(), "1Official-ID-role-text".i18n()),
                _subSection("1Using-e-Government-Services".i18n(), "1Using-e-Government-Services-text".i18n()),
                _subSection("1Replacement-of-health-insurance-card".i18n(), "1Replacement-of-health-insurance-card-text".i18n()),
              ],
            ),

            _sectionCard(
              title: "1if-you-lost-your-national-health-insurance-card".i18n(),
              children: [
                _subSection("1lost-national-health-insurance-card-steps".i18n(), "1lost-national-health-insurance-card-steps-text".i18n()),
                _subSection("1A-lost-report-to-a-nearby-police-station".i18n(), "1A-lost-report-to-a-nearby-police-station-text".i18n()),
              ],
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
}
