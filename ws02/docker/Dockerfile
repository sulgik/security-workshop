FROM node:22-slim

RUN npm install -g promptfoo@0.121.9

WORKDIR /workspace

# 스타터 설정 파일 복사
COPY configs/ ./configs/
COPY start.sh ./
RUN chmod +x start.sh

EXPOSE 15500

CMD ["/bin/bash", "start.sh"]
