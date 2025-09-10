@echo off
REM Flutter 웹 앱 자동 배포 스크립트

REM ?? 설정값 (수정 필요 시 여기만)
set REPO_URL=https://github.com/minnnn0924/KIIS-flutter.git
set BASE_HREF=/KIIS-flutter/

REM ? 프로젝트 루트로 이동 (원하는 경로로 수정 가능)
cd /d %~dp0

echo ?? Flutter 웹 앱 빌드 중...
flutter build web --base-href="%BASE_HREF%"

cd build\web

echo ?? Git 초기화 및 푸시 준비...
git init
git remote add origin %REPO_URL%
git checkout -b gh-pages
git add .
git commit -m "?? Auto deploy to GitHub Pages"
git push -f origin gh-pages

echo ? 배포 완료! 아래 주소에서 확인하세요:
echo https://minnnn0924.github.io/KIIS-flutter/
pause
