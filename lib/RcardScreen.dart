import 'package:flutter/material.dart'; // 화면을 만들기 위해 필요한 기본 플러터 도구를 불러옴
import 'package:localization/localization.dart'; // 여러 언어로 바꿔주는 기능을 사용하기 위해 불러옴

// 이 화면은 '재류카드(거주카드)'에 대해 설명하는 페이지를 만들어요
class RScreen extends StatelessWidget { // 화면의 구조가 바뀌지 않는 고정된 화면이에요
  @override
  Widget build(BuildContext context) { // 화면을 실제로 그리는 함수예요
    return Scaffold( // 화면의 기본 뼈대를 만드는 도구 (앱바, 본문 등 포함)
      backgroundColor: const Color(0xFFF5F7FA), // 화면 바탕 색깔을 아주 연한 회색으로 정해요
      appBar: AppBar( // 화면 맨 위에 있는 제목 바를 만들어요
        title: Text(
          'how-to-apply-for-a-residence-card'.i18n(), // 앱 제목을 여러 언어로 바꿀 수 있게 해요
          style: const TextStyle(fontWeight: FontWeight.bold), // 글씨를 굵게 보여줘요
        ),
        centerTitle: true, // 제목을 가운데로 정렬해요
        backgroundColor: Colors.indigo, // 앱바 배경 색깔을 남색으로 해요
        elevation: 6, // 앱바 아래 그림자를 약간 주어서 떠보이게 해요
        shadowColor: Colors.black45, // 그림자의 색깔을 어두운 회색으로 해요
      ),
      body: SingleChildScrollView( // 화면에 내용이 길면 스크롤할 수 있도록 해요
        padding: const EdgeInsets.all(20), // 화면의 테두리에 여백을 20씩 줘요
        child: Column( // 위에서 아래로 쌓는 구조를 만들어요
          crossAxisAlignment: CrossAxisAlignment.start, // 왼쪽 정렬로 내용들을 붙여요
          children: [ // 화면에 보여줄 내용들을 하나씩 써줘요
            _buildHeaderText("residence-card".i18n()), // 큰 제목을 가운데에 써줘요
            const SizedBox(height: 28), // 위 내용과 아래 내용 사이를 28만큼 띄워요

            _sectionCard( // 첫 번째 설명 카드
              title: "what-is-a-residence-card?".i18n(), // 카드의 제목
              body: "residence-card-description".i18n(), // 카드 안에 들어갈 설명 글
            ),

            const SizedBox(height: 40), // 이미지 전 여백

            _imageRow('assets/R_omo.png', 'assets/R_ura.png'), // 재류카드 앞면/뒷면 이미지를 나란히 보여줘요

            _sectionCard( // 체류 자격에 대한 설명 카드
              title: "status-of-residence".i18n(),
              body: "status-of-residence2things".i18n(),
            ),

            _sectionCard( // 체류 기간에 대한 설명 카드
              title: "period-of-stay".i18n(),
              body: "the-last-day-you-can-be-in-japan".i18n(),
            ),

            _sectionCard( // 재류카드 관련 규칙 설명 카드
              title: "rules-of-residence-card".i18n(),
              body: "rules-of-residence-card-4things".i18n(),
            ),

            _sectionCard( // 재류카드 신청에 필요한 서류 설명 카드
              title: "required-documents-for-residence-card-application-in-japan".i18n(),
              children: [ // 이 카드는 안에 여러 소제목을 넣을 수 있어요
                _subSection("initial-registration".i18n(), "initial-registration5things".i18n()), // 첫 등록 시 필요한 서류
                _subSection("renewal/extension-of-stay".i18n(), "renewal/extension-of-stay8things".i18n()), // 갱신 시 필요한 서류
                _subSection("notes-on-renewal".i18n(), "notes-on-renewal2things".i18n()), // 갱신 시 주의사항
              ],
            ),

            _sectionCard( // 추가 정보 카드
              title: "additional-information".i18n(),
              children: [
                _subSection("application-locations".i18n(), "application-locations2things".i18n()), // 어디에서 신청하는지
                _subSection("important-notes".i18n(), "important-notes2things".i18n()), // 중요한 주의사항
              ],
            ),

            _sectionCard( // 재류카드를 잃어버렸을 때 설명 카드
              title: "if-you-lost-your-residence-card".i18n(),
              body: "if-you-lost-your-residence-card2things".i18n(),
            ),

            _sectionCard( // 출입국관리국에 가져가야 할 물건 설명 카드
              title: "what-you-need-to-bring-to-the-immigration-services-agency".i18n(),
              body: "what-you-need-to-bring-to-the-immigration-services-agency3things".i18n(),
            ),

            const SizedBox(height: 40), // 마지막 여백
          ],
        ),
      ),
    );
  }

  // 큰 제목을 가운데에 진하게 표시해주는 함수예요
  Widget _buildHeaderText(String title) {
    return Center(
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 34, // 글씨 크기 크게
          fontWeight: FontWeight.w900, // 아주 굵게
          color: Colors.indigo, // 파란색 계열
          decoration: TextDecoration.underline, // 밑줄
        ),
      ),
    );
  }

  // 설명 카드 하나를 만드는 함수예요
  Widget _sectionCard({required String title, String? body, List<Widget>? children}) {
    return Card( // 카드 박스를 만들어요
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)), // 카드 테두리를 둥글게
      elevation: 4, // 카드에 그림자 주기
      margin: const EdgeInsets.symmetric(vertical: 10), // 위아래 간격 10
      child: Padding(
        padding: const EdgeInsets.all(20), // 카드 안쪽 여백 20
        child: Column( // 카드 안의 내용을 세로로 정렬
          crossAxisAlignment: CrossAxisAlignment.start, // 왼쪽 정렬
          children: [
            Text( // 카드 제목
              title,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            if (body != null && body.isNotEmpty) ...[ // 설명글이 있을 경우만 보여줌
              const SizedBox(height: 12), // 제목과 설명 사이 띄우기
              Text(
                body,
                style: const TextStyle(fontSize: 18, color: Colors.black87),
              ),
            ],
            if (children != null) ...children, // 소제목들이 있을 경우 같이 보여줌
          ],
        ),
      ),
    );
  }

  // 카드 안의 작은 소제목과 내용 만드는 함수예요
  Widget _subSection(String title, [String? content]) {
    return Padding(
      padding: const EdgeInsets.only(top: 18), // 위쪽 여백
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // 왼쪽 정렬
        children: [
          Text( // 소제목
            title,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: Colors.deepOrange,
            ),
          ),
          if (content != null && content.isNotEmpty) ...[ // 설명이 있을 경우 보여줌
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

  // 재류카드 앞면과 뒷면 이미지를 나란히 보여주는 함수예요
  Widget _imageRow(String leftImage, String rightImage) {
    return Column(
      children: [
        const SizedBox(height: 40), // 이미지 위 여백
        Row( // 가로로 정렬
          children: [
            Expanded( // 왼쪽 이미지가 공간을 절반 차지함
              child: ClipRRect( // 모서리를 둥글게 잘라서 이미지 보여줌
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  leftImage,
                  fit: BoxFit.contain, // 비율 유지하면서 줄이기
                  height: 180,
                ),
              ),
            ),
            const SizedBox(width: 16), // 이미지 사이 간격
            Expanded( // 오른쪽 이미지도 절반 차지
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