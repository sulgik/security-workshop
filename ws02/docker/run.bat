@echo off
REM Lab 2 — promptfoo 실습 실행 스크립트

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
