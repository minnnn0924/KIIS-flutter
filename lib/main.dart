import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:localization/localization.dart';
import 'RcardScreen.dart';
import 'McardScreen.dart';
import 'NScreen.dart';
import 'TodoScreen.dart';
import 'HoukenScreen.dart';
import 'DL.dart';
import 'Passport.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  static _MyAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>();

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale = const Locale('ko', 'KR');

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    LocalJsonLocalization.delegate.directories = ['lib/i18n'];

    return MaterialApp(
      locale: _locale,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        LocalJsonLocalization.delegate,
        MapLocalization.delegate,
      ],
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('ko', 'KR'),
        Locale('zh', 'CN'),
        Locale('ne', 'NP'),
        Locale('vi', 'VN'),
        Locale('ja', 'JP'),
      ],
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const App(),
    );
  }
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int _index = 0;

  final _pages = [
    const Buttons(),
    const TodoScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _index,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (value) => setState(() => _index = value),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.check_box), label: 'Check list'),
        ],
      ),
    );
  }
}

class Buttons extends StatelessWidget {
  const Buttons({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('九州情報大学'),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/kiis.png',
              fit: BoxFit.cover,
            ),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(minimumSize: Size(200, 50)),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => RScreen()));
                    },
                    child: Text('residence-card'.i18n()),
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(minimumSize: Size(200, 50)),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => MScreen()));
                    },
                    child: Text('my-number-card'.i18n()),
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(minimumSize: Size(200, 50)),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => HoukenScreen()));
                    },
                    child: Text('national-health-insurance'.i18n()),
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(minimumSize: Size(200, 50)),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => NScreen()));
                    },
                    child: Text('national-pension'.i18n()),
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(minimumSize: Size(200, 50)),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => PassportScreen()));
                    },
                    child: Text('passport'.i18n()),
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(minimumSize: Size(200, 50)),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => DlScreen()));
                    },
                    child: Text('license-1'.i18n()),
                  ),
                  const SizedBox(height: 50),
                  Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 10,
                    runSpacing: 10,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(minimumSize: Size(100, 100)),
                        onPressed: () {
                          MyApp.of(context)?.setLocale(const Locale('ko', 'KR'));
                        },
                        child: const Text('한국어'),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(minimumSize: Size(100, 100)),
                        onPressed: () {
                          MyApp.of(context)?.setLocale(const Locale('en', 'US'));
                        },
                        child: const Text('English'),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(minimumSize: Size(100, 100)),
                        onPressed: () {
                          MyApp.of(context)?.setLocale(const Locale('zh', 'CN'));
                        },
                        child: const Text('中文'),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(minimumSize: Size(100, 100)),
                        onPressed: () {
                          MyApp.of(context)?.setLocale(const Locale('ne', 'NP'));
                        },
                        child: const Text('नेपाली'),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(minimumSize: Size(100, 100)),
                        onPressed: () {
                          MyApp.of(context)?.setLocale(const Locale('vi', 'VN'));
                        },
                        child: const Text('Tiếng Việt'),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(minimumSize: Size(100, 100)),
                        onPressed: () {
                          MyApp.of(context)?.setLocale(const Locale('ja', 'JP'));
                        },
                        child: const Text('日本語'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
