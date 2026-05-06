@echo off
REM Lab 2 — promptfoo 실습 실행 스크립트

cd /d "%~dp0"

REM 이미지 존재 확인, 없으면 자동 빌드
docker image inspect ws02-lab2:latest >nul 2>&1
if errorlevel 1 (
  echo 이미지 'ws02-lab2' 가 없습니다. 빌드를 시작합니다 ^(약 1~2분^)...
  echo.
  docker build -t ws02-lab2 .
  if errorlevel 1 exit /b 1
  echo.
  echo 빌드 완료
  echo.
)

if "%DEEPSEEK_API_KEY%"=="" (
  set /p DEEPSEEK_API_KEY="DEEPSEEK_API_KEY 입력: "
)

echo.
echo 결과 UI: http://localhost:15500
echo 종료: exit 입력
echo.

docker run --rm -it ^
  -p 15500:15500 ^
  -e DEEPSEEK_API_KEY="%DEEPSEEK_API_KEY%" ^
  ws02-lab2
