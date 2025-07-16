import 'package:flutter/material.dart'; // 화면을 그릴 때 필요한 플러터 기본 도구를 불러옴
import 'package:flutter_localizations/flutter_localizations.dart'; // 다양한 언어 설정을 위해 필요함
import 'package:localization/localization.dart'; // 다국어 번역 기능을 사용하기 위한 라이브러리
import 'package:z2244/RcardScreen.dart'; // 거주카드 화면 파일을 불러옴
import 'McardScreen.dart'; // 마이넘버카드 화면 파일을 불러옴
import 'NScreen.dart'; // 연금 관련 화면 파일을 불러옴
import 'TodoScreen.dart'; // 체크리스트 화면 파일을 불러옴
import 'HoukenScreen.dart';
import 'DL.dart';
import 'Passport.dart';

void main() {
  runApp(const MyApp()); // 앱 실행을 시작하고 MyApp 위젯을 화면에 띄움
}

class MyApp extends StatefulWidget { // 앱 전체를 감싸는 메인 위젯 클래스 (상태가 바뀔 수 있음)
  const MyApp({super.key}); // 생성자

  static _MyAppState? of(BuildContext context) => // 앱 안에서 현재 상태에 접근할 수 있게 도와주는 함수
  context.findAncestorStateOfType<_MyAppState>();

  @override
  State<MyApp> createState() => _MyAppState(); // 상태를 만들어주는 함수
}

class _MyAppState extends State<MyApp> { // 실제 언어 설정을 바꾸는 역할을 하는 클래스
  Locale _locale = const Locale('ko', 'KR'); // 처음 앱을 실행하면 기본 언어는 한국어로 설정

  void setLocale(Locale locale) { // 언어를 바꾸는 함수
    setState(() { // 화면을 다시 그림
      _locale = locale; // 새로 선택한 언어로 바꿈
    });
  }

  @override
  Widget build(BuildContext context) { // 화면을 만드는 함수
    LocalJsonLocalization.delegate.directories = ['lib/i18n']; // 다국어 번역 파일이 들어 있는 폴더 위치를 설정

    return MaterialApp( // 전체 앱을 감싸는 위젯
      locale: _locale, // 현재 선택된 언어를 적용
      localizationsDelegates: [ // 여러 언어 관련 기능을 사용할 수 있도록 설정
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        LocalJsonLocalization.delegate,
        MapLocalization.delegate,
      ],
      supportedLocales: const [ // 앱에서 사용할 수 있는 언어 목록
        Locale('en', 'US'), // 영어
        Locale('ko', 'KR'), // 한국어
        Locale('zh', 'CN'), // 중국어
        Locale('ne', 'NP'), // 네팔어
      ],
      title: 'Flutter Demo', // 앱 제목
      theme: ThemeData( // 앱의 색상과 스타일을 설정
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple), // 기본 색상 설정
        useMaterial3: true, // 최신 디자인 사용
      ),
      home: const App(), // 앱 실행 시 처음 보여줄 화면은 App 클래스
    );
  }
}

class App extends StatefulWidget { // 홈화면과 체크리스트 화면을 보여주는 위젯
  const App({super.key});

  @override
  State<App> createState() => _AppState(); // 상태 연결
}

class _AppState extends State<App> { // 현재 선택된 탭에 따라 어떤 화면을 보여줄지 결정
  int _index = 0; // 처음엔 첫 번째 탭(Home)이 선택됨

  final _pages = [ // 보여줄 화면 목록
    const Buttons(), // 첫 번째는 홈화면
    const TodoScreen(), // 두 번째는 체크리스트 화면
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold( // 앱 화면 구조를 만듦
      body: IndexedStack( // 여러 화면 중에서 선택된 화면만 보여주되, 상태는 유지됨
        index: _index, // 현재 선택된 화면 인덱스
        children: _pages, // 두 개의 화면 리스트
      ),
      bottomNavigationBar: BottomNavigationBar( // 하단 탭바
        currentIndex: _index, // 선택된 탭 표시
        onTap: (value) => setState(() => _index = value), // 탭을 누르면 화면 전환
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'), // 홈 탭
          BottomNavigationBarItem(icon: Icon(Icons.check_box), label: 'Check list'), // 체크리스트 탭
        ],
      ),
    );
  }
}

class Buttons extends StatelessWidget { // 홈화면에 해당하는 클래스
  const Buttons({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( // 상단바
        backgroundColor: Theme.of(context).colorScheme.inversePrimary, // 테마에 맞는 배경색 사용
        title: const Text('九州情報大学'), // 상단 타이틀
      ),
      body: Stack( // 화면을 겹치게 배치 (배경 이미지 + 버튼)
        children: [
          Positioned.fill( // 화면 전체에 배경 이미지 깔기
            child: Image.asset(
              'assets/kiis.png', // 배경 이미지 파일 경로
              fit: BoxFit.cover, // 이미지가 화면을 꽉 채우도록 설정
            ),
          ),
          Align( // 화면 가운데 정렬
            alignment: Alignment.center,
            child: Column( // 버튼을 세로로 나열
              mainAxisSize: MainAxisSize.min, // 필요한 만큼만 공간 차지
              crossAxisAlignment: CrossAxisAlignment.center, // 가운데 정렬
              children: [
                ElevatedButton( // 거주카드 버튼
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(200,50),
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => RScreen())); // 버튼 누르면 RScreen으로 이동
                  },
                  child: Text('residence-card'.i18n()), // 다국어 텍스트 사용
                ),
                const SizedBox(height: 30), // 버튼 사이 간격
                ElevatedButton(// 마이넘버카드 버튼
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(200,50),
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MScreen()));
                  },
                  child: Text('my-number-card'.i18n()),
                ),
                const SizedBox(height: 30),
                ElevatedButton(// 건강보험 버튼
                  style: ElevatedButton.styleFrom(
                 minimumSize: Size(200,50),
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => HoukenScreen()));
                    },
                  child: Text('national-health-insurance'.i18n()),
                ),
                const SizedBox(height: 30),
                ElevatedButton( // 연금 버튼
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(200,50),
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => NScreen()));
                  },
                  child: Text('national-pension'.i18n()),
                ),
                const SizedBox(height: 30),
                ElevatedButton( // 운전면허 버튼
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(200,50),
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => PassportScreen()));
                  },
                  child: Text('passport'.i18n()),
                ),

                const SizedBox(height: 30),
                ElevatedButton( // 운전면허 버튼
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(200,50),
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DlScreen()));
                  },
                  child: Text('license-1'.i18n()),
                ),



                const SizedBox(height: 50),
                Center(
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 10,
                    children: [
                      ElevatedButton( // 한국어 버튼
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(100,100),
                        ),
                        onPressed: () {
                          MyApp.of(context)?.setLocale(const Locale('ko', 'KR'));
                        },
                        child: const Text('한국어'),
                      ),
                      ElevatedButton( // 영어 버튼
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(100,100),
                        ),
                        onPressed: () {
                          MyApp.of(context)?.setLocale(const Locale('en', 'US'));
                        },
                        child: const Text('English'),
                      ),
                      ElevatedButton( // 중국어 버튼
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(100,100),
                        ),
                        onPressed: () {
                          MyApp.of(context)?.setLocale(const Locale('zh', 'CN'));
                        },
                        child: const Text('中文'),
                      ),
                      ElevatedButton( // 네팔어 버튼
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(100,100),
                        ),
                        onPressed: () {
                          MyApp.of(context)?.setLocale(const Locale('ne', 'NP'));
                        },
                        child: const Text('नेपाली'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
