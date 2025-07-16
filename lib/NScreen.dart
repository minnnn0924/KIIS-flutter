import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:localization/localization.dart';

class NScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        title: Text(
          'how-to-apply-for-the-national-pension'.i18n(),
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
            _buildHeaderText("national-pension".i18n()),
            const SizedBox(height: 28),

            _sectionCard(
              title: "what-is-the-national-pension".i18n(),
              body: "national-pension-description".i18n(),
            ),

            _sectionCard(
              title: "who-needs-to-enroll?".i18n(),
              body: "2who-needs-to-enroll?".i18n(),
            ),

            _sectionCard(
              title: "enrollment-procedure".i18n(),
              body: "2enrollment-procedure".i18n(),
            ),

            _sectionCard(
              title: "premium-payments".i18n(),
              body: "2premium-payments".i18n(),
            ),

            _sectionCard(
              title: "a-special-system-for-student-payments".i18n(),
              body: "2a-special-system-for-student-payments".i18n(),
            ),

            _sectionCard(
              title: "benefits-of-the-national-pension".i18n(),
              body: "2benefits-of-the-national-pension".i18n(),
            ),

            _sectionCard(
              title: "working-students-and-pensions".i18n(),
              body: "2working-students-and-pensions".i18n(),
            ),

            _sectionCard(
              title: "inquiries-and-assistance".i18n(),
              body: "inquiries-and-assistance2".i18n(),
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

  Widget _sectionCard({required String title, required String body}) {
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
            const SizedBox(height: 12),
            Text(
              body,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
